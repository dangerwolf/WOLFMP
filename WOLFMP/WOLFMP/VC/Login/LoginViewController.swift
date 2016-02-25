//
//  LoginViewController.swift
//  
//
//  Created by 孙朗斌 on 15/7/28.
//
//

import UIKit
import TextFieldEffects
import Spring


class LoginViewController: UIViewController {

    @IBOutlet weak var userCodeTF: YokoTextField!
    @IBOutlet weak var pwdTF: YokoTextField!
    @IBOutlet weak var versionLabel: SpringLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        versionLabel.text = "当前版本：".stringByAppendingString((NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String)!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: 收键盘
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !(userCodeTF.exclusiveTouch) {
            userCodeTF.resignFirstResponder()
        }
        
        if !pwdTF.exclusiveTouch {
            pwdTF.resignFirstResponder()
        }
    }


    @IBAction func loginAction(sender: AnyObject) {
        
        userCodeTF.resignFirstResponder()
        pwdTF.resignFirstResponder()
        
        
        BmobUser.loginInbackgroundWithAccount(userCodeTF.text, andPassword: pwdTF.text) { (user, error) -> Void in
            if user != nil {
                self.performSegueWithIdentifier("login2tMenuSegue", sender: self)
            }else{
                let errrorInfo: AnyObject? = error.userInfo.values.first
                self.view.makeToast(message: "\(errrorInfo!)")
            }
        
        }
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

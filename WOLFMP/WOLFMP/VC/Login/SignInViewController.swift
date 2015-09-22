//
//  SignInViewController.swift
//  WOLFMP
//
//  Created by 孙海涛 on 15/7/29.
//  Copyright (c) 2015年 wolf. All rights reserved.
//

import UIKit
import TextFieldEffects
import ToastSwift
import Spring

class SignInViewController: UIViewController {

    @IBOutlet weak var userCodeTF: YokoTextField!
    @IBOutlet weak var pwdTF: YokoTextField!
    @IBOutlet weak var conPWDTF: YokoTextField!
    @IBOutlet weak var emailTF: YokoTextField!
    @IBOutlet weak var mobileTF: YokoTextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if !conPWDTF.exclusiveTouch {
            conPWDTF.resignFirstResponder()
        }
        if !emailTF.exclusiveTouch {
            emailTF.resignFirstResponder()
        }
        if !mobileTF.exclusiveTouch {
            mobileTF.resignFirstResponder()
        }

    }
    @IBAction func registerAction(sender: AnyObject) {
        
        userCodeTF.resignFirstResponder()
        pwdTF.resignFirstResponder()
        conPWDTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        mobileTF.resignFirstResponder()
        
        
        
        let usercode = userCodeTF.text
        let pwd = pwdTF.text
        let pwdc = conPWDTF.text
        let email = emailTF.text
        let mobile = mobileTF.text
        
        if !(usercode == "" || pwd == "" || pwdc == "" || email == "" || mobile == "") {
            if pwdc == pwd {
                if (email!.componentsSeparatedByString("@").count == 2 ) && (email!.componentsSeparatedByString(".").count > 1 ) {
                    if (mobile!.length == 11) || (mobile!.length == 14 ){
                        
                        let bUser = BmobUser()
                        bUser.username = usercode
                        bUser.password = pwd
                        bUser.email = email
                        bUser.mobilePhoneNumber = mobile
                        
                        bUser.signUpInBackgroundWithBlock({ (isSuccessful, error) -> Void in
                            
                            if isSuccessful {
                                //创建一个alert，并设置相关参数
                                let alert : UIAlertController = UIAlertController(title: "恭喜您", message: "注册成功", preferredStyle: UIAlertControllerStyle.Alert)
                                //        设置默认按钮
                                let defaultAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                                    self.performSegueWithIdentifier("backToLoginSegue", sender: self)
                                })
                                //        添加默认按钮到alert中
                                alert.addAction(defaultAction)
                                
                                //        显示alert
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                            }else{
                                self.showToast("\(error.userInfo.values.first!)")
                            }
                            
                        })
                        
                        
                        
                    }else{
                        showToast("手机号码格式不正确，请检查后重新输入")
                    }
                    
                }else{
                    showToast("邮箱格式不正确，请检查后重新输入")
                }
            }else{
                showToast("两次输入的密码不一致，请检查后重新输入")
            }
        }else{
            showToast("输入的注册信息不可为空，请检查后重新输入")
        }
        
        
        
        
    }
    
    
    func showToast(msg:String) {
        self.view.makeToast(message: msg)
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

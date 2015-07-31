//
//  MenuViewController.swift
//  YNMP
//
//  Created by Bjyn21 on 15/4/24.
//  Copyright (c) 2015年 bjyn. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController ,XDKAirMenuDelegate {

    var airMenuController = XDKAirMenuController.sharedMenu()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        airMenuController.airDelegate = self
//        airMenuController.isMenuOnRight = true
        self.view.addSubview(self.airMenuController.view)
        self.addChildViewController(self.airMenuController)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK - XDKAirMenuDelegate
    
    func airMenu(airMenu: XDKAirMenuController!, viewControllerAtIndexPath indexPath: NSIndexPath!) -> UIViewController! {
        let storyboard = self.storyboard
        var vc = UIViewController()
        vc.view.autoresizesSubviews = true
        vc.view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        
        switch(indexPath.row){
            case 0:
                vc = storyboard!.instantiateViewControllerWithIdentifier("MainTabbarVC") as! UITabBarController
            case 1:
                vc = storyboard!.instantiateViewControllerWithIdentifier("MainTabbarVC") as! UIViewController
        default:
            break
        }
        
        return vc
        
    }
    
    func tableViewForAirMenu(airMenu: XDKAirMenuController!) -> UITableView! {
        return self.tableView
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "MenuTableSegue"){
            self.tableView = segue.destinationViewController.tableView
        }
    }

}

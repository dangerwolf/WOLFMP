//
//  ConversationListViewController.swift
//  WOLFMP
//
//  Created by 孙海涛 on 15/7/30.
//  Copyright (c) 2015年 wolf. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        RCIMClient.sharedRCIMClient().getConversationList([RCConversationType.ConversationType_PRIVATE.rawValue])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    //重载函数，onSelectedTableRow 是选择会话列表之后的事件，该接口开放是为了便于您自定义跳转事件。在快速集成过程中，您只需要复制这段代码。
    
    
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        let conversationVC = RCConversationViewController()
        conversationVC.conversationType = model.conversationType
        conversationVC.targetId = model.targetId
        conversationVC.userName = model.conversationTitle
        conversationVC.title = model.conversationTitle
        self.navigationController?.pushViewController(conversationVC, animated: true)
    }
    



}

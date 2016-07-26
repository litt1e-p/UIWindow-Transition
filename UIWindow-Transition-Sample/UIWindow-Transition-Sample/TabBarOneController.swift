//
//  TabBarOneController.swift
//  UIWindow-Transition-Sample
//
//  Created by litt1e-p on 16/7/26.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

class TabBarOneController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .purpleColor()
        let oneVc = OneViewController()
        oneVc.tabBarItem.title = "One"
        oneVc.view.backgroundColor = .purpleColor()
        viewControllers = [UINavigationController(rootViewController: oneVc)]
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIApplication.sharedApplication().keyWindow?.transitRootVc(TabBarTwoController(), style: kAppWindowTransitionType, duration: nil)
    }
}

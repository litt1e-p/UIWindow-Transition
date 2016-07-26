//
//  TabBarTwoController.swift
//  UIWindow-Transition-Sample
//
//  Created by litt1e-p on 16/7/26.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

class TabBarTwoController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .purpleColor()
        let oneVc = TwoViewController()
        oneVc.tabBarItem.title = "Two"
        oneVc.view.backgroundColor = .orangeColor()
        viewControllers = [UINavigationController(rootViewController: oneVc)]
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIApplication.sharedApplication().keyWindow?.transitRootVc(TabBarOneController(), style: kAppWindowTransitionType, duration: nil)
    }
}

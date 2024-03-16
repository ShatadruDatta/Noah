//
//  AppDelegate.swift
//  Noah
//
//  Created by Shatadru Datta on 17/03/24.
//  Copyright © 2024 Noah. All rights reserved.
//

import UIKit
import SwiftyJSON

class TabBarController: UIViewController {
    
    var checkController = false
    var selectedIndex = 0
    var tabBarConstraint = 120.0
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.helper.tabBarViewController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //.....BottomBar......//
    func isShowBottomBar(isShow: Bool) {
        
        let deviceName = UIDevice.modelName.components(separatedBy: " ")
        if deviceName.contains("SE") {
            tabBarConstraint = 86.0
        }
        if isShow == true {
            NavigationHelper.helper.mainContainerViewController!.tabBarHeightConstraint.constant = DeviceType.IS_IPAD ? 0 : tabBarConstraint
            NavigationHelper.helper.mainContainerViewController!.view.layoutIfNeeded()
        } else {
            NavigationHelper.helper.mainContainerViewController!.tabBarHeightConstraint.constant = 0
            NavigationHelper.helper.mainContainerViewController!.view.layoutIfNeeded()
        }
    }
    
    @IBAction func jobs(_ sender: UIButton) {
        
    }
    
    @IBAction func loggedIn(_ sender: UIButton) {
        
    }
}

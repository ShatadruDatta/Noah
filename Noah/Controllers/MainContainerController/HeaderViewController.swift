//
//  AppDelegate.swift
//  Noah
//
//  Created by Shatadru Datta on 17/03/24.
//  Copyright © 2024 Noah. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {

    var didSetLang:((Bool) -> ())!
    var isBack = false
    var checkController = false
    var controller: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.helper.headerViewController = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //.........
    func isShowNavBar(isShow: Bool, content: String) {
        
    }
    
}

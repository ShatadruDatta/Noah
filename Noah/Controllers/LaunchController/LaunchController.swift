//
//  AppDelegate.swift
//  Noah
//
//  Created by Shatadru Datta on 17/03/24.
//  Copyright © 2024 Noah. All rights reserved.
//

import UIKit

class LaunchController: BaseViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var imgMoon: UIImageView!
    @IBOutlet weak var imgNoah: UIImageView!
    @IBOutlet weak var imgSubtitle: UIImageView!
    @IBOutlet weak var imgMoonVerticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgMoonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgMoonHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.helper.mainContainerViewController!.bottomConstraint.constant = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performAnimation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NavigationHelper.helper.headerViewController?.isShowNavBar(isShow: false, content: "")
        NavigationHelper.helper.tabBarViewController?.isShowBottomBar(isShow: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @objc func performAnimation() {
        self.imgMoonVerticalConstraint.constant = -100.0
        self.imgMoonWidthConstraint.constant = 100.0
        self.imgMoonHeightConstraint.constant = 100.0
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
            self.imgNoah.alpha = 1.0
            self.imgSubtitle.alpha = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                let dashVC = mainStoryboard.instantiateViewController(withIdentifier: "DashboardController") as! DashboardController
                NavigationHelper.helper.contentNavController!.pushViewController(dashVC, animated: true)
            }
        }
    }
}

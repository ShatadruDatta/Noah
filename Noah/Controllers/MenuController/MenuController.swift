//
//  AppDelegate.swift
//  Noah
//
//  Created by Shatadru Datta on 17/03/24.
//  Copyright © 2024 Noah. All rights reserved.
//

import UIKit

//@available(iOS 13.0, *)
class MenuController: BaseViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var tblMenu: UITableView!
    var isOpen = false
    var checkController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenu.tableFooterView = UIView()
        NavigationHelper.helper.reloadData = {
            self.tblMenu.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}


// MARK: - UITableViewDelegate, UITableViewDataSource
//@available(iOS 13.0, *)
extension MenuController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewBottomBorder = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 1))
        viewBottomBorder.backgroundColor = section == 3 ? .clear : UIColor.init(hexString: "dddddd")
        return viewBottomBorder
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblMenu.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.datasource = "" as AnyObject
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }

}

//MARK: MenuCell
class MenuCell: BaseTableViewCell {
    
    @IBOutlet weak var lblMenu: UILabel!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var imgIcon: UIImageView!
    
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                self.lblMenu.text = datasource as? String
                self.imgIcon.image = UIImage(named: datasource as? String ?? "")
            }
        }
    }
}

//MARK: ProdileCell
class ProfileCell: BaseTableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                imgProfile.layer.cornerRadius = 25.0
                imgProfile.backgroundColor = .green
            }
        }
    }
}

//
//  CategoryDetailsController.swift
//  Noah
//
//  Created by Shatadru Datta on 27/03/24.
//

import UIKit

class CategoryDetailsController: BaseViewController {

    @IBOutlet weak var viewImgContent: UIView!
    @IBOutlet weak var viewType: UIView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblTypeTitle: UILabel!
    @IBOutlet weak var txtViewContentdetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewType.layer.cornerRadius = 12.5
        viewImgContent.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: UIButton) {
        NavigationHelper.helper.contentNavController!.popViewController(animated: true)
    }
    
    @IBAction func favourite(_ sender: UIButton) {
        
    }
    
    @IBAction func share(_ sender: UIButton) {
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        
    }
}

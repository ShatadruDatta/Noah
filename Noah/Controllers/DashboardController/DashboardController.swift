//
//  DashboardController.swift
//  Noah
//
//  Created by Shatadru Datta on 17/03/24.
//

import UIKit

class DashboardController: BaseViewController {

    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var lblContext: UILabel!
    @IBOutlet weak var collCategory: UICollectionView!
    @IBOutlet weak var tblCategory: UITableView!
    var selectedIndex = 0
    var arrCategory = ["All", "Anxiety", "Stress", "Relationships"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collCategory.reloadData()
        // Do any additional setup after loading the view.
    }
}

// MARK: TableViewDelegate, TableViewDataSource
extension DashboardController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 294.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFeature = self.tblCategory.dequeueReusableCell(withIdentifier: "FeatureTableViewCell", for: indexPath) as! FeatureTableViewCell
        cellFeature.datasource = "" as AnyObject
        return cellFeature
    }
}

// MARK: FeatureTableViewCell
class FeatureTableViewCell: BaseTableViewCell {
    @IBOutlet weak var collFeature: UICollectionView!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                collFeature.reloadData()
            }
        }
    }
}

// MARK: CollectionViewDelegate, CollectionViewDataSource
extension DashboardController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCollCell = self.collCategory.dequeueReusableCell(withReuseIdentifier: "CategoriesCollCell", for: indexPath) as! CategoriesCollCell
        categoryCollCell.datasource = arrCategory[indexPath.item] as AnyObject
        if selectedIndex == indexPath.item {
            categoryCollCell.parentCollView.backgroundColor = UIColor.init(hexString: "C9AB8D")
            categoryCollCell.lblCategory.textColor = .white
        } else {
            categoryCollCell.parentCollView.backgroundColor = UIColor.init(hexString: "343947")
            categoryCollCell.lblCategory.textColor = UIColor.init(hexString: "716E8A")
        }
        return categoryCollCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        self.collCategory.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (arrCategory[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]).width) + 100, height: 40)
    }
}


//MARK: CategoriesCollectionCell
class CategoriesCollCell: BaseCollectionViewCell {
    @IBOutlet weak var parentCollView: UIView!
    @IBOutlet weak var lblCategory: UILabel!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                parentCollView.layer.cornerRadius = 20.0
                self.lblCategory.text =  datasource as? String
            }
        }
    }
}

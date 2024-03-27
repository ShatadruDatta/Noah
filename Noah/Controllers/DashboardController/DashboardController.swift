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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 294.0
        } else {
            return 160.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let imgIcon = UIImageView()
        imgIcon.frame = CGRect.init(x: 5, y: 12, width: 16, height: 14)
        let label = UILabel()
        label.frame = CGRect.init(x: 25, y: 0, width: headerView.frame.width-25, height: 40)
        if section == 0 {
            imgIcon.image = UIImage(named: "star")
            label.text = "FEATURED"
        } else {
            imgIcon.image = UIImage(named: "white_favrt")
            label.text = "YOUR FAVOURITES"
        }
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        headerView.addSubview(imgIcon)
        headerView.addSubview(label)
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cellFeature = self.tblCategory.dequeueReusableCell(withIdentifier: "FeatureTableViewCell", for: indexPath) as! FeatureTableViewCell
            cellFeature.datasource = "" as AnyObject
            return cellFeature
        } else {
            let cellFavrt = self.tblCategory.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
            cellFavrt.datasource = "" as AnyObject
            return cellFavrt
        }
    }
}

// MARK: FeatureTableViewCell
class FeatureTableViewCell: BaseTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collFeature: UICollectionView!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                collFeature.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let featureCollCell = self.collFeature.dequeueReusableCell(withReuseIdentifier: "FeatureCollCell", for: indexPath) as! FeatureCollCell
        featureCollCell.datasource = "" as AnyObject
        return featureCollCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let catDetVC = mainStoryboard.instantiateViewController(withIdentifier: "CategoryDetailsController") as! CategoryDetailsController
        NavigationHelper.helper.contentNavController!.pushViewController(catDetVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 325.0, height: 294.0)
    }
}

// MARK: FavouritesTableViewCell
class FavouritesTableViewCell: BaseTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collFavourite: UICollectionView!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                collFavourite.reloadData()
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favouritesCollCell = self.collFavourite.dequeueReusableCell(withReuseIdentifier: "FavouritesCollCell", for: indexPath) as! FavouritesCollCell
        favouritesCollCell.datasource = "" as AnyObject
        return favouritesCollCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.collFeature.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 160.0)
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


//MARK: FeatureCollectionCell
class FeatureCollCell: BaseCollectionViewCell {
    @IBOutlet weak var parentCollView: UIView!
    @IBOutlet weak var contextView: UIView!
    @IBOutlet weak var imgContent: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblNarrator: UILabel!
    @IBOutlet weak var lblStress: UILabel!
    @IBOutlet weak var btnFavrt: UIButton!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                parentCollView.layer.cornerRadius = 20.0
                contextView.layer.cornerRadius = 20.0
            }
        }
    }
}

//MARK: FavouritesCollectionCell
class FavouritesCollCell: BaseCollectionViewCell {
    @IBOutlet weak var parentCollView: UIView!
    @IBOutlet weak var imgContent: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNarrator: UILabel!
    @IBOutlet weak var lblRelationships: UILabel!
    @IBOutlet weak var btnLock: UIButton!
    override var datasource: AnyObject? {
        didSet {
            if datasource != nil {
                parentCollView.layer.cornerRadius = 10.0
                imgContent.layer.cornerRadius = 10.0
            }
        }
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
                self.lblCategory.text = datasource as? String
            }
        }
    }
}

//
//  CustomCell.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    //MARK: Properties
    var row    : Int!
    var arrayItems: [ItemObject]?{
        didSet{
            itemsCollection.reloadData()
        }
    }
    
    //MARK: @IBOutlets
    @IBOutlet weak var itemsCollection: UICollectionView!
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollection()
    }
    
    func configure(whitViewModel dataItems:ItemsObjectList, row: Int) {
        arrayItems = dataItems.results
        titleCategory.text = dataItems.itemType?.rawValue
    }
    
    private func setCollection() {
        itemsCollection?.registerNib(ItemsCollectionViewCell.stringRepresentation)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        itemsCollection.setCollectionViewLayout(layout, animated: true)
    }
    
}

extension CustomCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayItems?.count ?? 0
    }
    
    ///Custom cell for collection view , show data
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionViewCell.stringRepresentation, for: indexPath) as! ItemsCollectionViewCell
        let row = arrayItems?[indexPath.row]
        cell.itemTitle.text = row?.title == "" ? row?.name : row?.title
        cell.itemImage.isHidden = true
        ImageLoader.getImagen(name: row!.poster_path, round: false, width: 300, height: 400, completion: { (image) in
            cell.itemImage.image = image
            cell.itemImage.isHidden = false
        })
        activityIndicator.stopAnimating()
        return cell
    }
}

extension CustomCell: UICollectionViewDelegateFlowLayout {
    ///Set  size of the cell for collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 220)
    }
}

//
//  CatCell.swift
//  StreetCat
//
//  Created by MacRent on 11/9/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import UIKit

class CatCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var featureLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 5
    }

}

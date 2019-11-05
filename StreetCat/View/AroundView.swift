//
//  AroundView.swift
//  StreetCat
//
//  Created by changnam on 11/5/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

class AroundView: UIView {
    
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var hospitalButton: UIButton!
    @IBOutlet weak var restaurantButton: UIButton!
    @IBOutlet weak var shelterButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        catButton.alignVertical(spacing: 8)
        hospitalButton.alignVertical(spacing: 8)
        restaurantButton.alignVertical(spacing: 8)
        shelterButton.alignVertical(spacing: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func catBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func hospitalBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func restaurantBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func shelterBtnTapped(_ sender: UIButton) {
    }
    
}

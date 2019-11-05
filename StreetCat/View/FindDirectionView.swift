//
//  FindDirectionView.swift
//  StreetCat
//
//  Created by changnam on 11/5/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

class FindDirectionView: UIView {
    
    @IBOutlet weak var startingPointLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

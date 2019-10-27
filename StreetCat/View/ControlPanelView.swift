//
//  ControlPanelView.swift
//  StreetCat
//
//  Created by 홍창남 on 2019/10/27.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

class ControlPanelView: UIView {
    
    @IBOutlet weak var addCatButton: UIButton!
    @IBOutlet weak var findDirectionButton: UIButton!
    @IBOutlet weak var aroundButton: UIButton!

    var didTapAroundButton: ((_ sender: UIButton) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        addCatButton.alignVertical(spacing: 6)
        findDirectionButton.alignVertical(spacing: 6)
        aroundButton.alignVertical(spacing: 6)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func addCatBtnTapped(_ sender: UIButton) {

    }

    @IBAction func findDirectionBtnTapped(_ sender: UIButton) {

    }

    @IBAction func aroundBtnTapped(_ sender: UIButton) {
        didTapAroundButton?(sender)
    }
}

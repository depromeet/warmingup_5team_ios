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

    var didTapFindDirectionButton: ((_ sender: UIButton) -> Void)?
    var didTapAroundButton: ((_ sender: UIButton) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        addCatButton.alignVertical(spacing: 6)
        findDirectionButton.alignVertical(spacing: 6)
        aroundButton.alignVertical(spacing: 6)
        
        let selectedColor = UIColor(red: 240/255, green: 93/255, blue: 29/255, alpha: 1.0)
        
        addCatButton.setTitleColor(selectedColor, for: .selected)
        addCatButton.setImage(UIImage(named: "addCat")?.withRenderingMode(.alwaysTemplate), for: .selected)
        addCatButton.tintColor = selectedColor
        
        findDirectionButton.setTitleColor(selectedColor, for: .selected)
        findDirectionButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), for: .selected)
        findDirectionButton.tintColor = selectedColor
        
        aroundButton.setTitleColor(selectedColor, for: .selected)
        aroundButton.setImage(UIImage(named: "around")?.withRenderingMode(.alwaysTemplate), for: .selected)
        aroundButton.tintColor = selectedColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func addCatBtnTapped(_ sender: UIButton) {

    }

    @IBAction func findDirectionBtnTapped(_ sender: UIButton) {
        if !sender.isSelected {
            addCatButton.isSelected = false
            aroundButton.isSelected = false
        }
        didTapFindDirectionButton?(sender)
    }

    @IBAction func aroundBtnTapped(_ sender: UIButton) {
        if !sender.isSelected {
            addCatButton.isSelected = false
            findDirectionButton.isSelected = false
        }
        didTapAroundButton?(sender)
    }
}

//
//  ControlPanelContainerView.swift
//  StreetCat
//
//  Created by 홍창남 on 2019/10/28.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/// shadow와 cornerRadius를 동시에 반영하기 위한 ContainerView
class ControlPanelContainerView: UIView {

    let controlPanelView = ControlPanelView(frame: .zero)

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.masksToBounds = false
        layer.shadowColor = UIColor(white: 0, alpha: 0.11).cgColor
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 35).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let borderView = UIView(frame: bounds)
        borderView.layer.cornerRadius = 35
        borderView.layer.borderColor = UIColor(white: 0, alpha: 0.11).cgColor
        borderView.layer.borderWidth = 0.8
        borderView.layer.masksToBounds = true
        self.addSubview(borderView)

        borderView.addSubview(controlPanelView)

        borderView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
        controlPanelView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

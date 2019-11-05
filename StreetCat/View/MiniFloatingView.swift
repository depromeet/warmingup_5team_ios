//
//  MiniFloatingView.swift
//  StreetCat
//
//  Created by changnam on 11/5/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

enum FloatingViewType {
    case findDirection, around, none
}

class MiniFloatingView: UIView {
    
    @IBOutlet weak var containerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    
    var viewModel = MiniFloatingViewModel() {
        didSet {
            guard Thread.isMainThread else {
                fatalError("didSet은 Main Thread에서 호출되어야 합니다.")
            }

            configureContent(type: viewModel.type)
            configureAppearance(isSelected: viewModel.isSelected, type: viewModel.type)
        }
    }
    
    let findDirectionView = FindDirectionView(frame: .zero)
    let aroundView = AroundView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        containerView.addSubview(findDirectionView)
        containerView.addSubview(aroundView)
        
        self.clipsToBounds = true
        layer.cornerRadius = 24
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContent(type: FloatingViewType) {
        switch type {
        case .findDirection:
            findDirectionView.isHidden = false
            aroundView.isHidden = true
            findDirectionView.snp.makeConstraints {
                $0.leading.trailing.top.bottom.equalToSuperview()
            }
        case .around:
            findDirectionView.isHidden = true
            aroundView.isHidden = false
            aroundView.snp.makeConstraints {
                $0.leading.trailing.top.bottom.equalToSuperview()
            }
        case .none:
            break
        }
    }
    
    private func configureAppearance(isSelected: Bool, type: FloatingViewType) {
        let height = MiniFloatingViewModel.contentHeight(isSelected: isSelected, type: type)
        
        self.snp.updateConstraints {
            $0.height.equalTo(height)
        }
    }
}

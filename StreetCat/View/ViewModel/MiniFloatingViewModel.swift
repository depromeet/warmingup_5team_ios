//
//  MiniFloatingViewModel.swift
//  StreetCat
//
//  Created by changnam on 11/6/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

struct MiniFloatingViewModel {
    
    var type: FloatingViewType = .none
    var isSelected: Bool = false
    
    static func contentHeight(isSelected: Bool, type: FloatingViewType) -> CGFloat {
        guard isSelected else { return .zero }

        switch type {
        case .findDirection:
            return 287
        case .around:
            return 234
        case .none:
            return 0
        }
    }
}

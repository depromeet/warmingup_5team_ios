//
//  UIViewExtensions.swift
//  StreetCat
//
//  Created by 홍창남 on 2019/10/27.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        guard let nibs = bundle.loadNibNamed(nibName, owner: self, options: nil) else { return }
        guard let nib = nibs.first as? UIView else { return }

        nib.frame = bounds
        nib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(nib)
    }
}

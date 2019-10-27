//
//  UIButtonExtensions.swift
//  StreetCat
//
//  Created by 홍창남 on 2019/10/28.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func alignVertical(spacing: CGFloat) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font else { return }

        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width,
                                            bottom: -(imageSize.height + spacing), right: 0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0,
                                            bottom: 0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0, bottom: edgeOffset, right: 0)
    }
}

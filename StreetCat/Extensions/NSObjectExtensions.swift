//
//  NSObjectExtensions.swift
//  StreetCat
//
//  Created by MacRent on 11/9/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}

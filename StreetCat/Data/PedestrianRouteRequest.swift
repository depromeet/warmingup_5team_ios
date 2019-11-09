//
//  PedestrianRouteRequest.swift
//  StreetCat
//
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation

struct PedestrianRouteRequest: Codable {
    let startX: String?
    let startY: String?
    let endX: String?
    let endY: String?
    let startName: String?
    let endName: String?
    
}

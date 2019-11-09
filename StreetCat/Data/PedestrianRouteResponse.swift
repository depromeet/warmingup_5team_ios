//
//  PedestrianRouteResponse.swift
//  StreetCat
//
//  Copyright © 2019 depromeet. All rights reserved.
//

struct PedestrianRouteResponse: Codable {
    let type: String?
    let features: [TMAPFeatureNode]?
}

struct TMAPFeatureNode: Codable {
    let type: String?
    let geometry: TMAPGeometry?
    //    let properties: String?
}

enum TMAPGeometryType: String, Codable {
    case point = "Point"
    case lineString = "LineString"
}

struct TMAPGeometry: Codable {
    let type: TMAPGeometryType?
    var coordinates: [[Double]]?
    
    enum CodingKeys: String, CodingKey {
        case type
        case coordinates
    }
    
    init(dictionary: [String: Any]) {
        if let typeInString = dictionary[CodingKeys.type.rawValue] as? String {
            self.type = TMAPGeometryType(rawValue: typeInString)
        } else {
            self.type = nil
        }
        // Coordinates are either a type of [Double] or [[Double]] for TMAP APIs
        if let doubleWrappedCoordinates = dictionary[CodingKeys.coordinates.rawValue] as? [[Double]] {
            self.coordinates = doubleWrappedCoordinates
        } else if let singleWrappedCoordinates =  dictionary[CodingKeys.coordinates.rawValue] as? [Double] {
            self.coordinates = [singleWrappedCoordinates]
        } else {
            self.coordinates = nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(TMAPGeometryType.self, forKey: .type)
        do {
            self.coordinates = try container.decode([[Double]].self, forKey: .coordinates)
        } catch {
            self.coordinates = [try container.decode([Double].self, forKey: .coordinates)]
        }
    }
}

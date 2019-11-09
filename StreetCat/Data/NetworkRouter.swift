//
//  NetworkRouter.swift
//  StreetCat
//
//  Copyright © 2019 depromeet. All rights reserved.
//

import Alamofire

enum NetworkRouter: URLRequestConvertible {
    case pedestrianRoute(start: StreetCatMapPoint, end: StreetCatMapPoint)
    
    // MARK: - API HTTP Method
    var method: HTTPMethod {
        switch self {
        case .pedestrianRoute:
            return .post
        }
    }
    
    // MARK: - API Paths
    var path: String {
        switch self {
        case .pedestrianRoute:
            return "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1"
        }
    }
    
    // MARK: - API body
    var body: Data? {
        switch self {
        case .pedestrianRoute(let start, let end):
            let request = PedestrianRouteRequest(startX: String(start.x),
                                                 startY: String(start.y),
                                                 endX: String(end.x),
                                                 endY: String(end.y),
                                                 startName: "출발지",
                                                 endName: "도착지")
            return try? JSONEncoder().encode(request)
            
        default:
            return nil
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: path) else {
            throw StreetCatError.invalidAPIPathError
        }
        var request = URLRequest(url: url)
        // HTTP Method
        request.httpMethod = method.rawValue
        
        // Static Headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("6a26f15a-c395-446f-9eea-e5e1f7c97735", forHTTPHeaderField: "appKey")
        
        // Timeout values
        request.timeoutInterval = TimeInterval(10) // seconds
        
        // Parameters
        request.httpBody = body
        return request
    }
}


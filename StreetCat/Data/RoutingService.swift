//
//  RoutingService.swift
//  StreetCat
//
//  Copyright © 2019 depromeet. All rights reserved.
//

import RxSwift
import Alamofire

class RoutingService {
    
    static func pedestrianRoute(start: StreetCatMapPoint,
                                end: StreetCatMapPoint) -> Single<PedestrianRouteResponse> {
        return Single<PedestrianRouteResponse>.create { observer in
            let utilityQueue = DispatchQueue.global(qos: .utility)
            
            let route = NetworkRouter.pedestrianRoute(start: start,
                                                      end: end)
            let call = Alamofire.request(route)
                .validate()
                .responseData(queue: utilityQueue) { response in
                    #if DEBUG
                      print("Error: \(response.error)")
                      print("Timeline: \(response.timeline)")
                    #endif
                    if let error = response.error {
                        observer(.error(error))
                        print(error)
                    }
                    guard let data = response.data else {
                        observer(.error(StreetCatError.emptyAPIResponseError))
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let response = try decoder.decode(PedestrianRouteResponse.self, from: data)
                        observer(.success(response))
                    } catch {
                        observer(.error(StreetCatError.unmappableAPIResponseError))
                        print(error)
                    }
            }
            
            return Disposables.create() { call.cancel() }
        }
    }
    
}

//
//  StreetCatMapView.swift
//  StreetCat
//
//  Copyright © 2019 depromeet. All rights reserved.
//

import NMapsMap

class StreetCatMapView: NMFNaverMapView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        showLocationButton = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

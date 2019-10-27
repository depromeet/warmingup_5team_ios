//
//  MapViewController.swift
//  StreetCat
//
//  Created by 홍창남 on 2019/10/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit
import NMapsMap
import SnapKit

class MapViewController: UIViewController {

    // TODO: 디자인 가이드 반영
    let controlPanelView = ControlPanelView(frame: .zero)

    // TODO: SwiftUI 작업
    let floatingPanelViewController = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)

        view.addSubview(controlPanelView)

        addChild(floatingPanelViewController)
        view.addSubview(floatingPanelViewController.view)

        controlPanelView.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-24)
        }

        controlPanelView.didTapAroundButton = { [weak self] _ in
            self?.floatingPanelViewController.view.isHidden = false
        }

        floatingPanelViewController.view.snp.remakeConstraints {
            $0.leading.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.size.equalTo(300)
        }
        floatingPanelViewController.view.isHidden = true
        floatingPanelViewController.view.backgroundColor = .white
    }
}


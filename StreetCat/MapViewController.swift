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
import RxSwift

class MapViewController: UIViewController {
    
    var disposeBag = DisposeBag()

    let controlPanelContainerView = ControlPanelContainerView(frame: .zero)
    let floatingPanelViewController = FloatingPanelViewController(nibName: FloatingPanelViewController.className, bundle: nil)

    let miniFloatingView = MiniFloatingView(frame: .zero)
    private lazy var mapView = StreetCatMapView(frame: view.frame)

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(mapView)

        view.addSubview(miniFloatingView)
        view.addSubview(controlPanelContainerView)

        controlPanelContainerView.snp.makeConstraints {
            $0.height.equalTo(70)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }

        controlPanelContainerView.controlPanelView.didTapFindDirectionButton = { [weak self] sender in
            DispatchQueue.main.async {
                self?.tapControlPanelButton(sender: sender, type: .findDirection)
            }
        }
        
        controlPanelContainerView.controlPanelView.didTapAroundButton = { [weak self] sender in
            DispatchQueue.main.async {
                self?.tapControlPanelButton(sender: sender, type: .around)
            }
        }

        miniFloatingView.snp.makeConstraints {
            $0.leading.equalTo(controlPanelContainerView.snp.leading)
            $0.trailing.equalTo(controlPanelContainerView.snp.trailing)
            $0.bottom.equalTo(controlPanelContainerView.snp.top).offset(35)
            $0.height.equalTo(0)
        }
        
        miniFloatingView.aroundView.didTapCatButton = { [weak self] _ in
            guard let self = self else { return }
            
            self.present(self.floatingPanelViewController, animated: true, completion: nil)
        }
        
        // TODO: Attach actual locations
        let start = StreetCatMapPoint(x: 126.9478883, y: 37.546976)
        let end = StreetCatMapPoint(x: 126.9634018, y: 37.5457464)
        
        RoutingService.pedestrianRoute(start: start, end: end)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] response in
                guard let geometries: [TMAPGeometry?] = response.features?
                    .filter({ $0.geometry?.type == .some(.lineString)})
                    .map({ $0.geometry }) else {
                    return
                }
                
                geometries.forEach({ geometry in
                    guard let coordinates = geometry?.coordinates else { fatalError() }
                    print(coordinates)
                    let points = coordinates.map({ coordinate -> NMGLatLng in
                        NMGLatLng(lat: coordinate[1], lng: coordinate[0])
                    })
                    print(points)
                    let path = NMFPath(points: points)
                    path?.color = UIColor(red: 0, green: 97, blue: 186)
                    path?.width = 8
                    path?.mapView = self?.mapView.mapView
                })
                
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
        
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: start.y, lng: start.x))
        mapView.mapView.moveCamera(cameraUpdate)
    }

    private func tapControlPanelButton(sender: UIButton, type: FloatingViewType) {
        let isSelected = !sender.isSelected
        
        switch type {
        case .findDirection:
            controlPanelContainerView.controlPanelView.findDirectionButton.isSelected = isSelected
        case .around:
            controlPanelContainerView.controlPanelView.aroundButton.isSelected = isSelected
        case .none:
            break
        }

        self.miniFloatingView.viewModel = MiniFloatingViewModel(type: type, isSelected: isSelected)
        
        UIView.animate(withDuration: 0.7, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

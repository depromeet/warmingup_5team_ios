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

    let controlPanelContainerView = ControlPanelContainerView(frame: .zero)
    let floatingPanelViewController = FloatingPanelViewController(nibName: FloatingPanelViewController.className, bundle: nil)

    let miniFloatingView = MiniFloatingView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = NMFMapView(frame: view.frame)
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

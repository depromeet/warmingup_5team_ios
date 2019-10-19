//
//  MapViewController.swift
//  StreetCat
//
//  Created by 홍창남 on 2019/10/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MapViewController: UIViewController {

    let buttonContainerStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()

    let addCatButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("길냥이 추가", for: .normal)
        button.backgroundColor = .systemGray2
        button.addTarget(self, action: #selector(addCatBtnTapped), for: .touchUpInside)
        return button
    }()

    let searchDirectionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("길찾기", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(searchDirectionBtnTapped), for: .touchUpInside)
        return button
    }()

    let aroundButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("주변", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(aroundBtnTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonContainerStackView.addArrangedSubview(addCatButton)
        buttonContainerStackView.addArrangedSubview(searchDirectionButton)
        buttonContainerStackView.addArrangedSubview(aroundButton)

        self.view.addSubview(buttonContainerStackView)

        buttonContainerStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    @objc func addCatBtnTapped(_ sender: UIButton) {

    }

    @objc func searchDirectionBtnTapped(_ sender: UIButton) {

    }

    @objc func aroundBtnTapped(_ sender: UIButton) {

    }
}


//
//  FloatingPanelViewController.swift
//  StreetCat
//
//  Created by MacRent on 11/9/19.
//  Copyright © 2019 depromeet. All rights reserved.
//

import Foundation
import UIKit

class FloatingPanelViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Injected
    var catPedestrianRoutingHandler: ((StreetCatMapPoint) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CatCell.nib, forCellWithReuseIdentifier: CatCell.className)
    }
}

extension FloatingPanelViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dqCell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCell.className, for: indexPath)
        guard let cell = dqCell as? CatCell else { return dqCell }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let point = StreetCatMapPoint(x: 126.9462027, y: 37.548148)
            catPedestrianRoutingHandler?(point)
        case 1:
            let point = StreetCatMapPoint(x: 126.9411141, y: 37.538903)
            catPedestrianRoutingHandler?(point)
        case 2:
            let point = StreetCatMapPoint(x: 126.9634018, y: 37.5457464)
            catPedestrianRoutingHandler?(point)
        default:
            break
        }
        dismiss(animated: true, completion: nil)
    }
}

extension FloatingPanelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 87)
    }
}

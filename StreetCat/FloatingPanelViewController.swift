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
}

extension FloatingPanelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 87)
    }
}

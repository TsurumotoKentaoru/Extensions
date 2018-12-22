//
//  UICollectionview+Extension.swift
//
//
//  Created by 鶴本賢太朗 on 2018/12/22.
//  Copyright © 2018 Kentarou. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    internal func registerCell<T: UICollectionViewCell>(_ classType: T.Type) {
        let className: String = String(describing: classType)
        let nib: UINib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    internal func registerCells<T: UICollectionViewCell>(_ types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    internal func registerReusableView<T: UICollectionReusableView>(_ classType: T.Type, kind: String = UICollectionView.elementKindSectionHeader) {
        let className: String = String(describing: classType)
        let nib: UINib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    internal func registerReusableViews<T: UICollectionReusableView>(_ types: [T.Type], kind: String = UICollectionView.elementKindSectionHeader) {
        types.forEach { registerReusableView($0, kind: kind) }
    }
    
    internal func dequeueCell<T: UICollectionViewCell>(_ classType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let className: String = String(describing: classType)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as! T
    }
    
    internal func dequeueReusableView<T: UICollectionReusableView>(_ classType: T.Type, indexPath: IndexPath, kind: String = UICollectionView.elementKindSectionHeader) -> T {
        let className: String = String(describing: classType)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: className, for: indexPath) as! T
    }
}

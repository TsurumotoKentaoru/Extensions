//
//  UITableView+Extension.swift
//  AppStore
//
//  Created by 鶴本賢太朗 on 2018/12/22.
//  Copyright © 2018 Kentarou. All rights reserved.
//

import UIKit

extension UITableView {
    
    internal func registerCell<T: UITableViewCell>(_ classType: T.Type) {
        let className: String = String(describing: classType)
        let nib: UINib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    internal func registerCells<T: UITableViewCell>(_ types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    internal func dequeueCell<T: UITableViewCell>(_ classType: T.Type, indexPath: IndexPath) -> T {
        let className: String = String(describing: classType)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
}

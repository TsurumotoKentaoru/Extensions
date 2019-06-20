//
//  Notification+Extension.swift
//  DiaryApp
//
//  Created by 鶴本賢太朗 on 2019/06/20.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

extension Notification {
    // キーボードのサイズを取得する
    internal var keyboardSize: CGSize? {
        guard let userInfo: [AnyHashable : Any] = self.userInfo else { return nil }
        guard let value: NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return nil }
        let keyboardSize: CGSize = value.cgRectValue.size
        return keyboardSize
    }
}

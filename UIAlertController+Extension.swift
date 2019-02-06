//
//  UIAlertController+Extension.swift
//
//
//  Created by 鶴本賢太朗 on 2019/01/09.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

// TODO: 二つ以上のactionsheetを取得できるようになれば便利
extension UIAlertController {
    
    // ボタンが1つのアラートを取得する
    internal static func singleBtnAlert(title: String?, message: String?, btnTitle: String, cancelButtonTitle: String?, completion: (() -> Void)?) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        
        if let cancelButtonTitle: String = cancelButtonTitle {
            alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: {
                (action: UIAlertAction!) -> Void in
            }))
        }
        return alert
    }
    
    // ボタンが2つのアラートを取得する
    internal static func doubleBtnAlert(title: String?, message: String?, otherBtnTitle: String, cancelBtnTitle: String, style: UIAlertControllerStyle = .alert, completion: (() -> Void)?, cancel: (() -> Void)?) -> UIAlertController
    {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: cancelBtnTitle, style: .cancel, handler: { _ in
            if let cancel = cancel {
                cancel()
            }
        }))
        alert.addAction(UIAlertAction(title: otherBtnTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
    
    internal static func textFieldAlert(title: String?, message: String?, otherBtnTitle: String, cancelBtnTitle: String, placeholder: String?, textFieldDelegate: UITextFieldDelegate?, completion: ((_ text: String?) -> Void)?, cancel: (() -> Void)?) -> UIAlertController {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelBtnTitle, style: .cancel, handler: { _ in
            if let cancel = cancel {
                cancel()
            }
        }))
        alert.addAction(UIAlertAction(title: otherBtnTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            guard let completion = completion,
                let textField: UITextField = alert.textFields?.first else {
                    return
            }
            completion(textField.text)
        }))
        //textfiledの追加
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
            textField.delegate = textFieldDelegate
        }
        return alert
    }
}

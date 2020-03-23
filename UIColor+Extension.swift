//
//  UIColor+Extension.swift
//  ARPlacer
//
//  Created by 鶴本賢太朗 on 2019/02/17.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// イニシャライザ
    /// - Parameters:
    ///   - hex: 16進数、(0xFF00FFのような値を渡すこと)
    ///   - alpha: アルファ値
    internal convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    /// rgbから色を生成する
    /// - Parameters:
    ///   - r: 赤(0~255)
    ///   - g: 緑(0~255)
    ///   - b: 青(0~255)
    ///   - alpha: アルファ値(0~1.0)
    internal static func rgb(_ r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

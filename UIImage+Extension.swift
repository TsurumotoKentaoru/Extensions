//
//  UIImage+Extension.swift
//  ARPlacer
//
//  Created by 鶴本賢太朗 on 2019/02/07.
//  Copyright © 2019 Kentarou. All rights reserved.
//

import UIKit

extension UIImage {
    internal func resize(resizedSize: CGSize) -> UIImage? {
        let widthRatio: CGFloat = resizedSize.width / self.size.width
        let heightRatio: CGFloat = resizedSize.height / self.size.height
        let ratio: CGFloat = widthRatio < heightRatio ? widthRatio : heightRatio
        let newResizedSize: CGSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newResizedSize, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: newResizedSize))
        let resizedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    internal var isLongWidth: Bool {
        return self.size.width > self.size.height
    }
}

//
//  UIImageExtension.swift
//  BullseyeUITests
//
//  Created by b.lysikov on 20.07.2021.
//

import UIKit

extension UIImage {

    var removingStatusBar: UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }
        
        var yOffset: CGFloat = 0
        
        switch UIDevice.modelName {
        case "Simulator iPhone 11 Pro",
             "Simulator iPhone XS Max",
             "Simulator iPhone X",
             "Simulator iPhone XS":
            yOffset = 132
        case "Simulator iPhone XR",
             "Simulator iPhone 11":
            yOffset = 88
        case "Simulator iPhone 6 Plus",
             "Simulator iPhone 6S Plus",
             "Simulator iPhone 7 Plus",
             "Simulator iPhone 8 Plus":
            yOffset = 54
        default:
            yOffset = 40
        }

        let rect = CGRect(
            x: 0,
            y: Int(yOffset),
            width: cgImage.width,
            height: cgImage.height - Int(yOffset)
        )

        if let croppedCGImage = cgImage.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
        }

        return nil
    }
    
}

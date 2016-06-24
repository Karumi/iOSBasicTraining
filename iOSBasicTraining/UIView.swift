//
//  UIView.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func setRoundedCorners() {
        cornerRadius = self.bounds.height / CGFloat(2)
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(CGColor: color)
            }

            return nil
        }
        set {
            layer.borderColor = newValue?.CGColor
        }
    }

    func removeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}

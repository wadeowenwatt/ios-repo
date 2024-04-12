//
//  UIViewExtensions.swift
//  study-ios
//
//  Created by Linhtn1 on 9/4/24.
//

import UIKit

public extension UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = CGFloat(newValue)
        }
    }
}

public extension UIView {
    
    @IBInspectable var cornerRadiusUIView: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}

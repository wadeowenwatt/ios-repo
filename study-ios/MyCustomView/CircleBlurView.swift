//
//  CircleBlurView.swift
//  study-ios
//
//  Created by Linhtn1 on 29/3/24.
//
import UIKit

class CircleBlurView: UIView {
    
    @IBOutlet var circleView: UIView!
    
    @IBOutlet var blurView: UIView!
    @IBOutlet var blurWidthConstraint: NSLayoutConstraint!
    @IBOutlet var blurHeightConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        blurWidthConstraint.constant = CGFloat(frame.size.width)
        blurHeightConstraint.constant = CGFloat(frame.size.height / 2)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


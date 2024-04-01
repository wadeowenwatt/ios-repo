//
//  ViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 24/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardView: UIView!
    
    @IBOutlet var centerContent: UIView!
    @IBOutlet var bigCircleView: UIView!
    @IBOutlet var blurBigCircle: UIView!
    @IBOutlet var heightConstraintBlur: NSLayoutConstraint!
    
    @IBOutlet var smallCircleView: UIView!
    @IBOutlet var smallCircle: UIView!
    @IBOutlet var blurSmallCircle: UIView!
    @IBOutlet var heightSmallConstraintBlur: NSLayoutConstraint!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var ultimateBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let heightViewCard = cardView.frame.size.height
        let widthViewCard = cardView.frame.size.width
        
        // Get date
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        
        // Get location
        /// TODO:
        
        // build UI for big blur circle
        heightConstraintBlur.constant = centerContent.frame.size.height / 2
        addEffectForView(view: blurBigCircle, intensity: CGFloat(0.6))
        bigCircleView.layer.cornerRadius = CGFloat(bigCircleView.frame.size.width / 2)
        
        // build UI for small blur circle
        smallCircleView.backgroundColor = .clear
        heightSmallConstraintBlur.constant = smallCircleView.frame.size.height / 2
        addEffectForView(view: blurSmallCircle, intensity: CGFloat(0.15))
        smallCircle.layer.cornerRadius = CGFloat(smallCircle.frame.size.width / 2)
        
        ultimateBtn.layer.cornerRadius = 8
        
        
        // build UI for cardview
        cardView.layer.cornerRadius = 10
//        let testView = BlurCircleView()
//        self.addChild(testView)
//        view.addSubview(testView.view)
//        testView.view.frame = CGRect(x:0, y:0, width: 400, height: 400)
    }
    
    func addEffectForView(view: UIView, intensity: CGFloat) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            view.backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: .light)

            let blurEffectView = CustomIntensityVisualEffectView(effect: blurEffect, intensity: intensity)
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            
            view.addSubview(blurEffectView)
        } else {
            view.backgroundColor = .white
        }
    }
}

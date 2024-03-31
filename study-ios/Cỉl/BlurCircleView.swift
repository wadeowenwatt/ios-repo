//
//  BlurCircleView.swift
//  study-ios
//
//  Created by Linhtn1 on 30/3/24.
//

import UIKit

class BlurCircleView: UIViewController {

    @IBOutlet var bgView: UIView!
    
    @IBOutlet var circleView: UIView!
    @IBOutlet var circleConstraintTop: NSLayoutConstraint!
    
    @IBOutlet var blurView: UIView!
    @IBOutlet var blurViewConstraintTop: NSLayoutConstraint!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: "BlurCircleView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgViewSide = bgView.frame.size.height
    
        circleConstraintTop.constant = bgViewSide / 4
        blurViewConstraintTop.constant = bgViewSide / 2
        
//        circleView.layer.cornerRadius = bgViewSide / 4
        
        addEffectForView(view: blurView)
    }

    func addEffectForView(view: UIView) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            view.backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: .light)

            let blurEffectView = CustomIntensityVisualEffectView(effect: blurEffect, intensity: CGFloat(0.6))
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            
            view.addSubview(blurEffectView)
        } else {
            view.backgroundColor = .white
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

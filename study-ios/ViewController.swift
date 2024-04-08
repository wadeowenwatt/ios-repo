//
//  ViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 24/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signInView: UIView!
    @IBOutlet var formView: UIView!
    @IBOutlet var heightSignInView: NSLayoutConstraint!
    @IBOutlet var heightFormView: NSLayoutConstraint!
    var isHiddingUI = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Draw signInView
        signInView.layer.cornerRadius = 5
        formView.layer.cornerRadius = 3

    }
 
    @IBAction func onTap(_ sender: Any) {
        isHiddingUI = !isHiddingUI
        if (isHiddingUI) {
            heightSignInView.constant = 80
            heightFormView.constant = 0
        } else {
            heightSignInView.constant = 60
            heightFormView.constant = 200
        }
        triggerAnimation()
    }
    
    func triggerAnimation() {
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
}

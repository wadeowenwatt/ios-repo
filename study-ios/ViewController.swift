//
//  ViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 24/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signInView: UIView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    @IBOutlet var labelSignIn: UILabel!
    
    @IBOutlet var formView: UIView!
    @IBOutlet var labelEmail: UILabel!
    @IBOutlet var labelPassword: UILabel!
    @IBOutlet var signInBtn: UIButton!
    var isHiddingUI = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup tapGestureRecognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        signInView.addGestureRecognizer(tapGestureRecognizer)
        
        // Draw signInView
        signInView.layer.cornerRadius = 5
        labelSignIn.textColor = .red
        
        // Draw form view
        labelEmail.textColor = .systemPink
        labelPassword.textColor = .systemPink
        signInBtn.layer.cornerRadius = 8
    }
 
    @objc func viewTapped() {
        isHiddingUI = !isHiddingUI
        if (isHiddingUI) {
            UIView.animate(withDuration: 3.0) {
                self.heightConstraint.constant = 80
                self.topConstraint.constant = 310
                self.formView.isHidden = self.isHiddingUI
            }
        } else {
            UIView.animate(withDuration: 3.0) {
                self.heightConstraint.constant = 60
                self.topConstraint.constant = 220
                self.formView.isHidden = self.isHiddingUI
            }
        }
    }
    
}

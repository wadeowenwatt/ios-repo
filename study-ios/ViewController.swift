//
//  ViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 24/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        guard let pageViewController = self.parent as? PageViewController else {
            return
        }
        pageViewController.goToNextPage(pageControl: pageViewController.pageControl, currentIndex: pageViewController.currentIndex)
    }
    
    @IBAction func navigateToHomeScreen(_ sender: Any) {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeScreen")
        
        self.navigationController?.pushViewController(newViewController, animated: true)
//        newViewController.modalPresentationStyle = .fullScreen
//        self.present(newViewController, animated: true)
    }
}

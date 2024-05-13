//
//  DetailViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 12/5/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var movieBanner: UIImageView!
    
    @IBOutlet var movieName: UILabel!
    
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var genreLabel: UILabel!
    
    @IBOutlet var releaseDate: UILabel!
    
    @IBOutlet var durationLabel: UILabel!
    
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var movieDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn1.tintColor = .white
        btn2.tintColor = .white
        btn1.cornerRadius = CGFloat(20)
        btn2.cornerRadius = CGFloat(20)
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

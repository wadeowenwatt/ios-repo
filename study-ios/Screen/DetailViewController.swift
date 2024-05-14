//
//  DetailViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 12/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movieId: Int = 0
    var rating: Double = 0.0
    
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
        MovieService.sharedInstance.fetchMovieDetail(callSuccess: updateUI, movieId: movieId)
        
        // Do any additional setup after loading the view.
        btn1.tintColor = .white
        btn2.tintColor = .white
        btn1.cornerRadius = CGFloat(20)
        btn2.cornerRadius = CGFloat(20)
    }
    
    func updateUI(movieDetail: MovieDetailReponse) {
        movieBanner.load(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieDetail.poster_path!)")!)
        movieName.text = movieDetail.title
        ratingLabel.text = "Rating: \(rating)"
        var genres = ""
        for item in movieDetail.genres! {
            genres += "\(item.name!) "
        }
        genreLabel.text = "Genre: \(genres)"
        releaseDate.text = "Release date: \(movieDetail.release_date!)"
        durationLabel.text = "\(movieDetail.runtime!) minutes"
        movieDescription.text = movieDetail.overview
    }

}

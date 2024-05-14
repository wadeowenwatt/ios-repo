//
//  ViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 24/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var movieTableView: UITableView!
    
    var movieHomeData: [MovieResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // API call
        MovieService.sharedInstance.fetchMovieData(callSuccess: setDataToUI)
        
        
        // UI config
        navigationController?.hidesBarsOnSwipe = true
        
        movieTableView.sectionHeaderHeight = 100
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(HomeHeaderTableView.self, forHeaderFooterViewReuseIdentifier: HomeHeaderTableView.identifier)
        movieTableView.register(MovieCustomCell.nib(), forCellReuseIdentifier: MovieCustomCell.identifier)
    }
    
    func setDataToUI(listMovieResult: [MovieResult]) {
        movieHomeData = listMovieResult
        self.movieTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let movieDetailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetail") as! DetailViewController
        movieDetailVC.movieId = movieHomeData[indexPath.row].id!
        movieDetailVC.rating = movieHomeData[indexPath.row].vote_average!
        // set button back
        let backItem = UIBarButtonItem()
        backItem.title = "Back to movies"
        backItem.tintColor = .systemBlue
        
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(movieDetailVC, animated: true)
        
        //        print("selected cell: \(movieHomeData[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieHomeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCustomCell.identifier, for: indexPath) as! MovieCustomCell
        
        let movieResult = movieHomeData[indexPath.row]
        
        cell.labelTitle.text = movieResult.title
        cell.timeLabel.text = movieResult.release_date
        
        cell.imageBanner.load(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieResult.poster_path!)")!)
        print("https://image.tmdb.org/t/p/w500\(movieResult.poster_path!)")
        cell.imageBanner.contentMode = .scaleToFill
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeaderTableView.identifier)
        return header
    }
}

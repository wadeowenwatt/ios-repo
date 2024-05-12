//
//  ViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 24/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var movieTableView: UITableView!
    
    var names: [String] = ["test", "test1", "test2","test3","test4","test5","test6","test7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
        
        movieTableView.sectionHeaderHeight = 100
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(MovieCustomCell.nib(), forCellReuseIdentifier: MovieCustomCell.identifier)
        movieTableView.register(HomeHeaderTableView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let movieDetailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetail")
        
        movieDetailVC.navigationItem.title = names[indexPath.row]
        
        navigationController?.pushViewController(movieDetailVC, animated: true)
        
        print("selected cell: \(names[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCustomCell.identifier, for: indexPath) as! MovieCustomCell
        
        cell.labelTitle.text = names[indexPath.row]
        cell.timeLabel.text = "14 December 2018"
        cell.imageBanner.load(url: URL(string: "https://i.scdn.co/image/ab67706c0000da8479dc9fdddcdfd5515607dfa0")!)
        cell.imageBanner.contentMode = .scaleToFill
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeaderTableView.identifier)
        //        header?.textLabel?.text = "MOVIES"
        return header
    }
}

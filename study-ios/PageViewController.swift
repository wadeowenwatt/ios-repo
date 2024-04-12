//
//  PageViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 9/4/24.
//

import UIKit

class PageViewController: UIPageViewController {

    var pageControl = UIPageControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true)
        }
        configurePageControl()
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY * (1.75 / 3), width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController(name: "firstViewController"), self.newViewController(name: "secondViewController"),
                self.newViewController(name: "thirdViewController")]
    }()
    
    var currentIndex: Int {
        guard let vc = viewControllers?.first else { return 0 }
        return orderedViewControllers.firstIndex(of: vc) ?? 0
    }
    
    private func newViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: name)
    }

}


//
//  HomeHeaderTableView.swift
//  study-ios
//
//  Created by Linhtn1 on 4/5/24.
//

import UIKit

class HomeHeaderTableView: UITableViewHeaderFooterView {

    static let identifier = "HomeHeaderTableView"
    
    private let titleLabel: UILabel = {
        let titleLable = UILabel()
        titleLable.text = "Movies"
        titleLable.font = .systemFont(ofSize: 30, weight: .bold)
        titleLable.textColor = .white
        titleLable.textAlignment = .center
        return titleLable
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

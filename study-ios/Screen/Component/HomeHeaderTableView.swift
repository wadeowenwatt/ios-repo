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
        titleLable.font = .systemFont(ofSize: 25, weight: .bold)
        titleLable.textColor = .white
        titleLable.textAlignment = .center
        return titleLable
    }()
    
    private let hamburgerButton: UIButton = {
        let hamburgerButton = UIButton()
        hamburgerButton.tintColor = .white
        hamburgerButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        return hamburgerButton
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(hamburgerButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        hamburgerButton.sizeToFit()
        hamburgerButton.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 0, width: 50, height: 20)
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

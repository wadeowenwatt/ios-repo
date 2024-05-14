//
//  MovieCustomCell.swift
//  study-ios
//
//  Created by Linhtn1 on 4/5/24.
//

import UIKit

class MovieCustomCell: UITableViewCell {
    static let identifier = "MovieCell"
    
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var imageBanner: UIImageView!
    
    @IBOutlet var viewCard: UIView!
    static func nib() -> UINib {
        return UINib(nibName: "MovieCustomCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imageBanner.layer.cornerRadius = 4
        viewCard.layer.cornerRadius = 4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UIImageView {
    func load(url: URL) {
        let backgroundQueue = DispatchQueue(label: "background_queue",
                                                    qos: .background)
        
        backgroundQueue.async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        
    }
}

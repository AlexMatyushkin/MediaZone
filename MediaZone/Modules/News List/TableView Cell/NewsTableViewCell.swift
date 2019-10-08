//
//  NewsTableViewCell.swift
//  MediaZone
//
//  Created by Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class NewsTableViewCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var presentImage: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)

        self.layer.borderWidth = 3
        self.layer.cornerRadius = 15
        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.publishDateLabel.text = nil
        self.presentImage.isHidden = false
    
        self.titleLabel.snp.remakeConstraints { [weak self] make in
            make.trailing.equalTo(presentImage.snp.leading).inset(8)
        }
    }
    
    func setImage(link: String?) {
        guard let link = link else {
            self.presentImage.isHidden = true
            self.titleLabel.snp.remakeConstraints { [weak self] make in
                make.trailing.equalToSuperview().inset(11)
            }
            return
        }
        guard let url = URL(string: link) else { return }
        self.presentImage.kf.setImage(with: url)
        self.presentImage.snp.remakeConstraints { [weak self] make in
            guard let height = self?.frame.height else { return }
            let margin = height / 2
            make.top.equalToSuperview().inset(margin)
        }
    }
}

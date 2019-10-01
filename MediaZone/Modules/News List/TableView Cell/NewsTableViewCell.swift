//
//  NewsTableViewCell.swift
//  MediaZone
//
//  Created by Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 20
        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.publishDateLabel.text = nil
    }
    
}

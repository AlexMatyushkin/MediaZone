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
        layer.cornerRadius = 15
        layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.publishDateLabel.text = nil
    }
    
 override open var frame: CGRect {
     get {
         return super.frame
     }
     set (newFrame) {
         var frame =  newFrame
         frame.origin.y += 10
         frame.origin.x += 10
         frame.size.height -= 15
         frame.size.width -= 2 * 10
         super.frame = frame
     }
 }

}

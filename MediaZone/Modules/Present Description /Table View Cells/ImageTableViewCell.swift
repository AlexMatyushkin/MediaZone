//
//  ImageTableViewCell.swift
//  MediaZone
//
//  Created by Алексей Матюшкин on 07/10/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit
import Kingfisher

class ImageTableViewCell: UITableViewCell {


    @IBOutlet weak var imagePresentView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(link: String?) {
        guard let link = link else { return }
        guard let url = URL(string: link) else { return }
        self.imagePresentView.kf.setImage(with: url)
    }
}

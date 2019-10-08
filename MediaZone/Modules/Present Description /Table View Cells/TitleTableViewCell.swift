//
//  TitleTableViewCell.swift
//  MediaZone
//
//  Created by Алексей Матюшкин on 07/10/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {


    
    @IBOutlet weak var stringLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.stringLabel.text = nil
    }
}

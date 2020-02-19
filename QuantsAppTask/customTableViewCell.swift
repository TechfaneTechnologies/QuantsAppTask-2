//
//  customTableViewCell.swift
//  QuantsAppTask
//
//  Created by avula koti on 11/02/20.
//  Copyright © 2020 avula koti. All rights reserved.
//

import UIKit
class customTableViewCell: UITableViewCell {
    var cell: [customTableViewCell] = []
    @IBOutlet weak var profilePicImage: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
 

}

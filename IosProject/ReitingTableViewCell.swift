//
//  ReitingTableViewCell.swift
//  IosProject
//
//  Created by Serik on 02.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit

class ReitingTableViewCell: UITableViewCell {

    @IBOutlet var username: UILabel!
    @IBOutlet var row: UILabel!
    @IBOutlet var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    


}

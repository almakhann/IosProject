//
//  CustomTableViewCell.swift
//  IosProject
//
//  Created by Serik on 01.05.17.
//  Copyright © 2017 Serik. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var levelLAbel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var point: UILabel!
    @IBOutlet var Btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

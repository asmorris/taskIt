//
//  CellTableViewCell.swift
//  taskIt
//
//  Created by Andrew Morrison on 2016-03-19.
//  Copyright © 2016 Andrew Morrison. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var subTaskLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

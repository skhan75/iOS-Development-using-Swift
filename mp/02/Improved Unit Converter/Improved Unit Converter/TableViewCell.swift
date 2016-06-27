//
//  TableViewCell.swift
//  Improved Unit Converter
//
//  Created by Sami Ahmad Khan on 6/18/16.
//  Copyright © 2016 Sami Ahmad Khan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
   // @IBOutlet weak var cellText: UILabel!

    @IBOutlet weak var cellText: UILabel!
    
    //@IBOutlet weak var areaCellText: UILabel!
    
    //@IBOutlet weak var value: UILabel!
    @IBOutlet weak var value: UITextField!
    @IBOutlet weak var unitName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

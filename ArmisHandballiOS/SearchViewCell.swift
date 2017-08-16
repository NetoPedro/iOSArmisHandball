//
//  SearchViewCell.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 16/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {

    @IBOutlet weak var searchItemIcon: UIImageView!
    @IBOutlet weak var searchItemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

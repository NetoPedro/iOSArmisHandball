//
//  EditionCell.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 31/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class EditionCell: UITableViewCell {

    @IBOutlet weak var season: UILabel!
    var edition = Edition()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

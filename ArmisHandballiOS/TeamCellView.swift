//
//  TeamCellView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 04/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class TeamCellView: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    var teamPK = 0
    var teamNameString = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  GoalsScoredViewCell.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 19/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GoalsScoredViewCell: UITableViewCell {

    @IBOutlet weak var playersFaceImage: UIImageView!
    @IBOutlet weak var playersNameLabel: UILabel!
    @IBOutlet weak var numberOfGoalsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

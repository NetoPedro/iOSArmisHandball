//
//  GameViewMatchDayCell.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 02/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GameViewMatchDayCell: UITableViewCell {
    @IBOutlet weak var homeTeamName: UILabel!
    
    @IBOutlet weak var visitorTeamName: UILabel!
    
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var visitorScore: UILabel!
    @IBOutlet weak var visitorTeamScore: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

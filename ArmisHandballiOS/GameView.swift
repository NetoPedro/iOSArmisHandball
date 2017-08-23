//
//  Game.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 14/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GameView: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    @IBOutlet weak var visitorsTeamName: UILabel!
    @IBOutlet weak var visitorsTeamScore: UILabel!
    @IBOutlet weak var visitorsTeamLogo: UIImageView!
    var game : Game? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    

}

//
//  GameInfoView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 24/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GameInfoView: UIViewController {

    @IBOutlet weak var gameScoresView: UIView!
    @IBOutlet weak var homeLogo: UIImageView!
    @IBOutlet weak var visitorsLogo: UIImageView!
    @IBOutlet weak var visitorsScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    var game : Game?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let game = game{
            homeLogo.image = UIImage(data: game.homeClubLogo)
            visitorsLogo.image = UIImage(data: game.visitorClubLogo)
            visitorsScore.text = String( game.visitorTeamResult)
            homeScore.text = String( game.homeTeamResult)
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MatchDaysViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 31/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class TournamentViewController: UIViewController {
    
    @IBOutlet weak var tournamentName: UILabel!
    @IBOutlet weak var tournamentImage: UIImageView!
    var name = ""
    var image = UIImage()
    var containerViewController : MatchDaysTableTableViewController?
    var editionPk = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tournamentImage.image = image
        tournamentName.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MatchDayContainerSegue" {
            containerViewController = segue.destination as? MatchDaysTableTableViewController
            containerViewController?.editionPk = editionPk
        }
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

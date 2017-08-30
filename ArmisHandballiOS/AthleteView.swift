//
//  AthleteView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 30/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class AthleteView: UIViewController {

    
    var athlete = Athlete()
    var athletePk = 2
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerGender: UILabel!
    @IBOutlet weak var playerNationality: UILabel!
    @IBOutlet weak var playerTeam: UILabel!
    @IBOutlet weak var playerPhot: UIImageView!
    @IBOutlet weak var pictureView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureView.layer.cornerRadius = pictureView.frame.size.width/2
        pictureView.clipsToBounds = true
        // get Athlete pela PK
        if athletePk == 0 {
            athlete = Athlete()
        }
        else if athletePk == 1 {
            athlete = Athlete(1)
        }
        playerName.text = "Name:  \(String(describing: athlete.name))"
        playerGender.text = "Gender:  \(athlete.gender)"
        playerTeam.text = "Club:  \(athlete.clubName)"
        playerNationality.text = "Nationality:  \(athlete.nationality)"
        playerPhot.image = UIImage(data : (athlete.photo))
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

//
//  AthleteView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 30/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class AthleteView: UIViewController {

    
    var athlete : Athlete?
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

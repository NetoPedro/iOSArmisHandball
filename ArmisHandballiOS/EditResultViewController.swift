//
//  EditResultViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 06/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class EditResultViewController: UIViewController {

    
    var goalRecord = [GoalRecord]()
    var athletes = [Athlete]()
    var teamName : String?
    var gamePk : Int?
    var teamPk : Int?
    var teamScore : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

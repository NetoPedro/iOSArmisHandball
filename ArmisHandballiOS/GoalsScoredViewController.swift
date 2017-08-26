//
//  GoalsScoredViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 19/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GoalsScoredViewController: UITableViewController {
    var goalRecords = [GoalRecord]()
    var game : Game?
    
    func loadData(){
        goalRecords.append(GoalRecord())
        goalRecords.append(GoalRecord(type:1))
        goalRecords.append(GoalRecord(type:2))
        goalRecords.append(GoalRecord())
        goalRecords.append(GoalRecord(type:1))
        goalRecords.append(GoalRecord())

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        //Receber o jogo por parametro
        //WebServices para ir buscar info do jogo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if game == nil {return 0}
        // Rest Request to return a list of gameRecords of the game
        return goalRecords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalsScoredViewCell", for: indexPath) as? GoalsScoredViewCell else{fatalError()}
        
        let goalRecord = goalRecords[indexPath.row]
        cell.playersFaceImage.image = UIImage(data:goalRecord.athletePhoto)
        cell.playersNameLabel.text = goalRecord.athleteName
        cell.numberOfGoalsLabel.text = String(goalRecord.count)
        if goalRecord.team == 0 {cell.backgroundColor = UIColor.cyan}
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

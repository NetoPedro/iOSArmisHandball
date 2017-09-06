//
//  GoalsScoredViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 19/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GoalsScoredViewController: UITableViewController {
    var homeGoalRecords = [GoalRecord]()
    var visitorGoalRecords = [GoalRecord]()
    var goals = [GoalRecord]()
    var loaded = false
    var game : Game?
    var home = 0
    func loadData(){
        refreshControl?.beginRefreshing()
        guard let pk  = game?.pk else {return }
        guard let url = URL(string: Properties.getGoalRecordURL(game: String(pk))) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            
            
            if let data = data {
                self.goals.removeAll()
                do{
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
                    let newGoals = try  decoder.decode([GoalRecord].self, from: data)
                    self.goals += newGoals
                    self.divideGoals()
                    print(self.goals.count)
                }
                catch{
                    print("Unable to decode")
                }
            }
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
            self.loaded = true
            }.resume()
    
       // while !loaded{}
        
    }
    func divideGoals(){
        homeGoalRecords.removeAll()
        visitorGoalRecords.removeAll()
        for goal in goals{
            if goal.team == 0 {
                homeGoalRecords.append(goal)
            }
            else{
                visitorGoalRecords.append(goal)
            }
        }
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
        return visitorGoalRecords.count + homeGoalRecords.count
    }

    func  fillCell(cell : GoalsScoredViewCell, indexPath: IndexPath) -> GoalsScoredViewCell{
        var goalRecord = GoalRecord()
        if homeGoalRecords.count > indexPath.row{
            goalRecord = homeGoalRecords[indexPath.row]}
        else {
            goalRecord = visitorGoalRecords[indexPath.row - homeGoalRecords.count]}
        cell.playersFaceImage.image = UIImage(named:"athlete")//UIImage(data:goalRecord.athletePhoto!)
        cell.playersNameLabel.text = goalRecord.athleteName
        cell.numberOfGoalsLabel.text = String(goalRecord.count)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if homeGoalRecords.count > indexPath.row {guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeGoalsScoredViewCell", for: indexPath) as? GoalsScoredViewCell else{fatalError()}
            return fillCell(cell: cell, indexPath: indexPath)
        }
        else{guard let cell = tableView.dequeueReusableCell(withIdentifier: "VisitorGoalsScoredViewCell", for: indexPath) as? GoalsScoredViewCell else{fatalError()}
            return fillCell(cell: cell, indexPath: indexPath)
        }
        return UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let athleteView = segue.destination as? AthleteView
            guard let selectedCell = sender as? GoalsScoredViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            if homeGoalRecords.count > indexPath.row{
                let selectedAthlete = homeGoalRecords[indexPath.row]
                athleteView?.athletePk = selectedAthlete.athletePk
                
            }
            else {
                    let selectedAthlete = visitorGoalRecords[indexPath.row - homeGoalRecords.count]
                    athleteView?.athletePk = selectedAthlete.athletePk
                
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Marcadores"
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

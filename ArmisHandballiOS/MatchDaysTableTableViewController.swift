//
//  MatchDaysTableTableViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 01/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class MatchDaysTableTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
   
    

    var matchDays = [MatchDay]()
    var games = [Game]()
    var editionPk = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GetMatchDays by Edition PK
        matchDays.append(MatchDay())
        matchDays.append(MatchDay(1))
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //get Games by matchDay pk
        games.removeAll()
        if matchDays[row].name == "Jornada 1" {
            games.append(Game())
        }
        else{
            games.append(Game(type : 1))
        }
        refreshControl?.beginRefreshing()
        tableView.reloadData()
        refreshControl?.endRefreshing()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return matchDays[row].name
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return matchDays.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as? GameView else {
            fatalError("The dequeued cell is not an instance of GameView")
        }
        let game = games[indexPath.row]
        
        cell.homeTeamName.text = game.homeClubName
        cell.visitorsTeamName.text = game.visitorClubName
        cell.homeTeamScore.text = String(game.homeTeamResult)
        cell.visitorsTeamScore.text = String(game.visitorTeamResult)
        cell.game = game
        cell.homeTeamLogo.image = UIImage(data : game.homeClubLogo)
        cell.visitorsTeamLogo.image = UIImage(data: game.visitorClubLogo)
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

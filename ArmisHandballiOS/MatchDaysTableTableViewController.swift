//
//  MatchDaysTableTableViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 01/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class MatchDaysTableTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    

    var matchDays = [MatchDay]()
    var games = [Game]()
    var editionPk = 0
    
    func getMatchDays(){
        self.refreshControl?.beginRefreshing()
        
        guard let url = URL(string: "http://192.168.100.16/Armis/api/MatchDays?editionPK=\(editionPk)") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            
            
            if let data = data {
                self.matchDays.removeAll()
                do{
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
                    let newMatchDays = try  decoder.decode([MatchDay].self, from: data)
                    self.matchDays += newMatchDays
                    print(self.matchDays.count)
                }
                catch{
                    print("Unable to decode")
                }
                DispatchQueue.main.sync {
                    self.pickerView.reloadAllComponents()
                }

            }
            
            }.resume()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // guard let view = sender as? GameView else{return}
        // self.game = view.game!
        
        guard let gameInfoController = segue.destination as? GameInfoView else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedCell = sender as? GameViewMatchDayCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedGame = games[indexPath.row]
        gameInfoController.game = selectedGame
    }
    
    
    
    
    func getGames(_ pk : Int){
        self.refreshControl?.beginRefreshing()
        
        guard let url = URL(string: "http://192.168.100.16/Armis/api/Games?matchDayPk=\(pk)") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            
            
            if let data = data {
                self.games.removeAll()
                do{
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
                    let newGames = try  decoder.decode([Game].self, from: data)
                    self.games += newGames
                    print(self.games.count)
                }
                catch{
                    print("Unable to decode")
                }
                DispatchQueue.main.sync {
                    self.refreshControl?.beginRefreshing()
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                }
                
            }
            
            }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMatchDays()
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //get Games by matchDay pk
        
        getGames(matchDays[row].pk)
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as? GameViewMatchDayCell else {
            fatalError("The dequeued cell is not an instance of GameView")
        }
        let game = games[indexPath.row]
        
        cell.homeTeamName.text = game.homeClubName
        cell.visitorTeamName.text = game.visitorClubName
        cell.homeScore.text = String(game.homeTeamResult)
        cell.visitorScore.text = String(game.visitorTeamResult)
        cell.homeTeamLogo.image = UIImage(named: "club")// UIImage(data : game.homeClubLogo!)
        cell.visitorTeamScore.image = UIImage(named: "club")//UIImage(data: game.visitorClubLogo!)
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

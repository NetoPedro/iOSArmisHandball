//
//  GamesView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 14/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class GamesView: UITableViewController {
    
    //MARK: Properties
    
    var games = [Game]()
    
    private func loadGames(){
      //Fill with URL address 
        guard let url = URL(string: "URLS") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.games.removeAll()
                do{
                    let newGames = try  JSONDecoder().decode([Game].self, from: data)
                    self.games += newGames
                }
                catch{
                    print("Unable to decode")
                }
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Receive games from the server
        loadGames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        //Check possible more sections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameView", for: indexPath) as? GameView else {
          fatalError("The dequeued cell is not an instance of GameView")
        }
        let game = games[indexPath.row]
        cell.homeTeamName.text = game.homeTeam.club.name
        cell.visitorsTeamName.text = game.visitorTeam.club.name
        cell.homeTeamScore.text = String(game.homeTeamScore)
        cell.visitorsTeamScore.text = String(game.visitorTeamScore)
        cell.game = game
        // fill cell with logos
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

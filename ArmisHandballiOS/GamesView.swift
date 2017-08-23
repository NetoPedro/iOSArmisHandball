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
      /*  guard let url = URL(string: "http://192.168.100.14/Armis/api/games") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            guard let error = error else {
                return
            }
            print(error)

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
        }.resume()*/
        games.append(Game.init())
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
        cell.homeTeamName.text = game.homeClubName
        cell.visitorsTeamName.text = game.visitorClubName
        cell.homeTeamScore.text = String(game.homeTeamResult)
        cell.visitorsTeamScore.text = String(game.visitorTeamResult)
        cell.game = game
        cell.homeTeamLogo.image = UIImage(data : game.homeClubLogo)
        cell.visitorsTeamLogo.image = UIImage(data: game.visitorClubLogo)
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

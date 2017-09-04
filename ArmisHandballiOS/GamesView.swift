//
//  GamesView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 14/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit
import os.log

class GamesView: UITableViewController {
    
    //MARK: Properties
    
    var games = [Game]()
    var game = Game()
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
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        games.append(Game.init())
        
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
        games.append(Game.init(type:1))
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
        print("Secçoes")
        print(countSections())
        return countSections()
        //Check possible more sections
    }
    
    func countSections() -> Int {
        var i = 1;
        var prevGame = games.first
        for game in games {
            if game.date != prevGame?.date{
                //Verificar condição
                i=i+1
            }
            prevGame = game
        }
        return i
    }
    
    func countRowsSection(section : Int) -> Int {
        var i = 0, j = 0;
        var prevGame = games.first
        for game in games {
            if game.date != prevGame?.date{
                //Verificar condição
                i=i+1
            }
            if(i > section) {break}
            if i == section {j+=1}
            prevGame = game
        }
        return j
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Secao")
        print (section)
        print("Row")
        print(countRowsSection(section: section))
        return countRowsSection(section: section)
    }

    
    func findGameSectionRow(section : Int, row : Int) -> Game{
        var i = 0, j = 0;
        var prevGame = games.first
        for game in games {
            if game.date != prevGame?.date{
                //Verificar condição
                i=i+1
            }
            if(i > section) {break}
            if i == section {if j == row{return game}
                j+=1}
            prevGame = game
        }
        return prevGame!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameView", for: indexPath) as? GameView else {
          fatalError("The dequeued cell is not an instance of GameView")
        }
        let game = findGameSectionRow(section: indexPath.section , row: indexPath.row)
        
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
       // guard let view = sender as? GameView else{return}
       // self.game = view.game!
        
        guard let gameInfoController = segue.destination as? GameInfoView else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedCell = sender as? GameView else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedGame = findGameSectionRow(section: indexPath.section, row: indexPath.row)
        gameInfoController.game = selectedGame
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 ;
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var i = 0, j = 0;
        var prevGame = games.first
        for game in games {
            if i == section {break}
            if game.date != prevGame?.date{
                //Verificar condição
                i=i+1
            }
            prevGame = game
        }
        return prevGame?.date
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

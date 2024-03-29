
//
//  TeamTableViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 04/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {

    var teams = [Team]()
    var clubPk  = 0
    
    func loadTeams(){
        self.refreshControl?.beginRefreshing()
        
        guard let url = URL(string: Properties.getTeamsUTL(club: String(clubPk))) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            
            
            if let data = data {
                self.teams.removeAll()
                do{
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
                    let newTeams = try  decoder.decode([Team].self, from: data)
                    self.teams += newTeams
                    print(self.teams.count)
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
        loadTeams()
    
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
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamCellView else{fatalError()}
        
        let team = teams[indexPath.row]
        cell.teamNameString = "\(team.ageRange)    \(team.gender)"
        cell.teamName.text = cell.teamNameString
        cell.teamPK = team.pk
        
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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

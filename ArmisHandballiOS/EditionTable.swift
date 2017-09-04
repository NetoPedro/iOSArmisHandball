//
//  EditionTable.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 31/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class EditionTable: UITableViewController {

    var editions = [Edition]()
    var tournamentPK = 0
    var tournamentName = ""
    var tournamentImage : Data?
    func loadEditions(){
        self.refreshControl?.beginRefreshing()
        
        guard let url = URL(string: "http://192.168.100.16/Armis/api/Editions?tournamentPk=\(tournamentPK)") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            
            
            if let data = data {
                self.editions.removeAll()
                do{
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
                    let newEditions = try  decoder.decode([Edition].self, from: data)
                    self.editions += newEditions
                    print(self.editions.count)
                }
                catch{
                    print("Unable to decode")
                }
            }
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
            }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Fill with editions using tournament pk
       loadEditions()
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
        return editions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditionCell", for: indexPath) as? EditionCell else {fatalError()}
        
        cell.edition = self.editions[indexPath.row]
        cell.season.text = cell.edition.season

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 ;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tournamentView = segue.destination as? TournamentViewController
        guard let selectedCell = sender as? EditionCell else {
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        guard let indexPath = tableView.indexPath(for: selectedCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
            let selectedEdition = editions[indexPath.row]
            tournamentView?.editionPk = selectedEdition.pk
            tournamentView?.name = tournamentName
        tournamentView?.image = UIImage(data : tournamentImage!)!
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

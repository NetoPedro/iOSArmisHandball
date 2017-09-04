//
//  SearchViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 17/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {

    var searchables = [Searchable]()
    var athletes  = [Searchable]()
    var clubs = [Searchable]()
    var tournaments = [Searchable]()
    @IBOutlet weak var searchBar: UISearchBar!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        searchables.removeAll()
        
        /*searchables.append(Searchable(1))
        searchables.append(Searchable())
        searchables.append(Searchable("OI"))
        searchables.append(Searchable())
        searchables.append(Searchable(1))
        searchables.append(Searchable())
        searchables.append(Searchable("OI"))
        searchables.append(Searchable())
        searchables.append(Searchable(1))
        searchables.append(Searchable())
        searchables.append(Searchable("OI"))
        fillLists("")*/
        doSearch()
    }
    
    func doSearch(){
        
        guard let text = searchBar.text else {return}
        guard let url = URL(string: "http://192.168.100.16/Armis/api/Searchable?name=\(text)") else {return}
        print(url)
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
           
            
            if let data = data {
                self.searchables.removeAll()
                do{
                    let newItems = try  JSONDecoder().decode([Searchable].self, from: data)
                    self.searchables += newItems
                    
                }
                catch{
                    print("Unable to decode")
                }
                DispatchQueue.main.sync {
                    self.fillLists(text)
                    self.refreshControl?.beginRefreshing()
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                }
            }
            }.resume()

       
    }
    func fillLists(_ text: String){
        clubs.removeAll()
        athletes.removeAll()
        tournaments.removeAll()
        for searchable in searchables{
          //  if !searchable.name.localizedCaseInsensitiveContains(text) && text != "" {continue}
            if searchable.type == 0 {clubs.append(searchable)
                continue
            }
            if searchable.type == 2 {athletes.append(searchable)
                continue
            }
            if searchable.type == 1 {tournaments.append(searchable)
                
            }
            
        }
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar){
        doSearch()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        doSearch()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return clubs.count}
        if section == 1 {return athletes.count}
        if section == 2 {return tournaments.count}
        return 0
    }

    
    fileprivate func fillParameters(_ indexPath: IndexPath, _ cell: SearchViewCell, _ section : Int) {
        var searchable : Searchable
        var image = ""
        if section == 0{
            searchable = clubs[indexPath.row]
            image = "club"
        }
        else if section == 1{
             searchable = athletes[indexPath.row]
            image = "athlete"
        }
        else {
            searchable = tournaments[indexPath.row]
            image = "TeamLogo"
        }
        cell.searchItemIcon.image = UIImage(named: image) //UIImage(data: searchable.icon!)
        cell.searchItemName.text = searchable.name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier  = ""
        if indexPath.section == 0{
            identifier = "clubCell"
        }
            
        else if indexPath.section == 1{
            identifier = "playerCell"

        }
        else if indexPath.section == 2{
            identifier = "tournamentCell"

        }
       

        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? SearchViewCell else {fatalError()}
        fillParameters(indexPath, cell, indexPath.section)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {return "Clubs"}
        if section == 1 {return "Athletes"}
        return "Tournaments"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AthleteSegueSearch" {
            let athleteView = segue.destination as? AthleteView
            guard let selectedCell = sender as? SearchViewCell else {
                return
            }
            
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                return
            }
            
            let selectedAthlete = athletes[indexPath.row]
            athleteView?.athletePk = selectedAthlete.pk
        }
        if segue.identifier == "TournamentSegueSearch" {
            let tournamentView = segue.destination as? EditionTable
            guard let selectedCell = sender as? SearchViewCell else {
                return
            }
            
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                return
            }
            
            let selectedTournament = tournaments[indexPath.row]
            tournamentView?.tournamentPK = selectedTournament.pk
        }
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

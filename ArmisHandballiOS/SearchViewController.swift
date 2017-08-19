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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
    }
    
    func doSearch(){
        print("Ola")
        guard let text = searchBar.text else {return}
        print("OI")
        guard let url = URL(string: "http://192.168.100.14:52955/api/Searchable?name=\(text)") else {return}
        print(url)
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
                self.searchables.removeAll()
                do{
                    let newItems = try  JSONDecoder().decode([Searchable].self, from: data)
                    self.searchables += newItems
                    
                }
                catch{
                    print("Unable to decode")
                }
            }
            }.resume()
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchables.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewCell", for: indexPath) as? SearchViewCell else {fatalError()}
        let searchable = searchables[indexPath.row]
        cell.searchItemIcon.image = UIImage(data: searchable.icon)
        cell.searchItemName.text = searchable.name

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

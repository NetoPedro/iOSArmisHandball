//
//  AthleteView.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 30/08/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class AthleteView: UIViewController {

    
    var athlete = Athlete()
    var athletePk = 2
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerGender: UILabel!
    @IBOutlet weak var playerNationality: UILabel!
    @IBOutlet weak var playerTeam: UILabel!
    @IBOutlet weak var playerPhot: UIImageView!
    @IBOutlet weak var pictureView: UIView!
    
    func getAthlete(){
        guard let url = URL(string: "http://192.168.100.16/Armis/api/Athletes/\(athletePk)") else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response else {
                return
            }
            print(response)
            
            
            if let data = data {
                do{
                    let decoder = JSONDecoder()
                    decoder.dataDecodingStrategy = JSONDecoder.DataDecodingStrategy.base64
                    let newAthlete = try  decoder.decode(Athlete.self, from: data)
                    self.athlete = newAthlete
                }
                catch{
                    print("Unable to decode")
                }
            }
            DispatchQueue.main.sync {
                
                self.playerName.text = "Name:  \(String(describing: self.athlete.name))"
                self.playerGender.text = "Gender:  \(self.athlete.gender)"
                self.playerTeam.text = "Club:  \(self.athlete.clubName)"
                self.playerNationality.text = "Nationality:  \(self.athlete.nationality)"
                self.playerPhot.image = UIImage(named : "athlete")//UIImage(data : (self.athlete.photo)!)
            }
            }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureView.layer.cornerRadius = pictureView.frame.size.width/2
        pictureView.clipsToBounds = true
        // get Athlete pela PK
        getAthlete()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

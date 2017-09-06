//
//  LoginViewController.swift
//  ArmisHandballiOS
//
//  Created by Pedro Neto on 06/09/17.
//  Copyright © 2017 Pedro Neto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginSelected(_ sender: UIButton) {
        
        //Fazer Request para login
         //Se o Login estiver ok
        
        
        Properties.user = self.usernameText.text
        Properties.pass = self.passwordText.text
        
        var request = URLRequest(url: URL(string: Properties.getAccountURL())!)
        request.httpMethod = "POST"
        guard let pass = self.passwordText.text else {return}
        guard let user = self.usernameText.text else{return}
        let postString = "username=\(user)&password=\(pass)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            else {
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
                Properties.loged = true
                DispatchQueue.main.sync {
                    self.navigationController?.popViewController(animated: true)
                }
            
            }
        }
        task.resume()
        
       
        
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

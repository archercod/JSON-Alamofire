//
//  ViewController.swift
//  Biokod
//
//  Created by Marcin Pietrzak on 17.08.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var tokenArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let USER_PARAMETERS = ["params": ["password": passwordTextField.text?.sha256(), "email": emailTextField.text], "method": "login", "id": "12345", "jsonrpc": "2.0"] as [String : Any]
        
        Alamofire.request(URL_USERS, method: .post, parameters: USER_PARAMETERS, encoding: JSONEncoding.default, headers : HEADERS)
            .responseJSON { response in
                switch (response.result) {
                case .success:
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                case .failure:
                    print("Error")
                }
            }
        }
}





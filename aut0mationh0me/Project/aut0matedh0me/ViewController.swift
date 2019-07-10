//
//  ViewController.swift
//  aut0matedh0me
//
//  Created by kevin ngadiuba on 22/05/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let URL_USER_REGISTER = "http://1fr0st.it/userRegister.php"
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var labelText: UILabel!
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        let parameters : Parameters = [
            "utente_nome": firstName.text! ,
            "utente_cognome" : lastName.text! ,
            "utente_email" : email.text!,
            "utente_password" : password.text!]
        
        
        
        Alamofire.request(URL_USER_REGISTER , method: .post , parameters: parameters).responseString
            {
               response in
                print (response)

                var statusCode = response.response?.statusCode
                if statusCode == 401
                {
                    self.labelText.text = "Un campo non è stato riempito"
                }
                if statusCode == 202
                {
                    self.performSegue(withIdentifier: "welcomePageSegue", sender: nil)
                }
                else if statusCode == 201
                {
                    self.labelText.text = "Utente non registrato"
                }

        }
        
//         V2
//                Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
//                {
//                    response in
//                    //printing response
//                    print(response)
//        
//                    //getting the json value from the server
//                    if let result = response.result.value {
//                        //converting it as NSDictionary
//                        let jsonData = result as! NSDictionary
//        
//                            //displaying the message in label
//                            self.labelText.text = jsonData.value(forKey: "message") as! String?
//        
//        
//                    }
//                }
        
        
        
        
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}


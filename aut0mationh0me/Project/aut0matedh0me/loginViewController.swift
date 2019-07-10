//
//  loginViewController.swift
//  aut0matedh0me
//
//  Created by kevin ngadiuba on 30/05/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import Eureka
import Alamofire

class loginViewController: FormViewController {

    struct FormItems
    {
        static let nome = "tagNome"
        static let cognome = "tagCognome"
        static let email = "tagEmail"
        static let password = "tagPassword"
        static let telefono = "tagPhone"
        static let indirizzo = "tagIndirizzo"
    }
    
    var nome : String = ""
    var cognome : String = ""
    var email : String = ""
    var password : String = ""
    var telefono : Int = 0
    var indirizzo : String = ""
    
    let URL_USER_LOGIN = "http://1fr0st.it/userLogin.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var groupRulesEmail = RuleSet<String>()
        groupRulesEmail.add(rule: RuleRequired() )
        groupRulesEmail.add(rule: RuleEmail() )
        
        var groupRulesText = RuleSet<String>()
        groupRulesText.add(rule: RuleRequired() )
        groupRulesText.add(rule: RuleMinLength(minLength: 2) )
        
        form
            +++ Section(header: "Login", footer: "")
            <<< NameRow(FormItems.nome)
            { rowName in
                rowName.title = "email"
                rowName.placeholder = "..."
                rowName.add(ruleSet: groupRulesEmail)
                rowName.validationOptions = .validatesOnChangeAfterBlurred
                }.onChange
                {
                    rowName in
                    self.nome = rowName.value!
                    print(self.nome)
                    rowName.updateCell()
                }.cellUpdate
                { cell , rowName in
                    if !rowName.isValid {
                        cell.titleLabel?.textColor = .red
                    }
        }
        
            <<< PasswordRow(FormItems.password)
            { rowPassword in
                rowPassword.title = "Password"
                rowPassword.placeholder = "..."
                }.onChange
                { rowPassword in
                    self.password = rowPassword.value!
                    print(self.password)
                    rowPassword.updateCell()
                }.cellUpdate
                { cell , rowPassword in
                    if !rowPassword.isValid {
                        cell.titleLabel?.textColor = .red
                    }
        }
        
        +++ Section()
        +++ Section()
        +++ Section()
        <<< ButtonRow()
            { registrati in
                registrati.title = "Registrati"
                registrati.presentationMode = .segueName(segueName: "loginToRegister", onDismiss: nil)
        }
        <<< ButtonRow()
            { accedi in
                accedi.title = "Accedi"
                
            }.onCellSelection
            { cell, bottone in
                let error = bottone.section?.form?.validate()
                if ((error != nil))
                {
                    let parameters : Parameters = [
                        "utente_email" : self.email ,
                        "utente_password" : self.password]
                    
                    Alamofire.request(self.URL_USER_LOGIN , method: .post , parameters: parameters).responseString
                        {
                            response in
                            print (response)
                            
                            var statusCode = response.response?.statusCode
                            if statusCode == 401
                            {
                                print ("errore 401")
                            }
                            if statusCode == 202
                            {
                                
                                self.performSegue(withIdentifier: "loginToDashboard", sender: nil)
                                
                                
                            }
                            else if statusCode == 201
                            {
                                print ("errore 201")
                            }
                            
                    }
                }
                else
                {
                    print ("error")
                    
                } //
        }
        
        
        
        
    }
    

}

//
//  WelcomePageViewController.swift
//  aut0matedh0me
//
//  Created by kevin ngadiuba on 28/05/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import Eureka
import Alamofire

class WelcomePageViewController:  FormViewController
{
    
    let URL_USER_REGISTER = "http://1fr0st.it/userRegister.php"
    
    struct FormItems
    {
        static let nome = "tagNome"
        static let cognome = "tagCognome"
        static let email = "tagEmail"
        static let password = "tagPassword"
        static let telefono = "tagPhone"
        static let indirizzo = "tagIndirizzo"
    }
    
    struct segueNames
    {
        static let registerToLogin = "registerToLogin"
        static let loginToRegister = "loginToRegister"
        static let registerToHi = "registerToHi"
        static let hiToDashboard = "hiToDashboard" 
    }
    
    var nome : String = ""
    var cognome : String = ""
    var email : String = ""
    var password : String = ""
    var telefono : Int = 0
    var indirizzo : String = ""
    


    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var groupRulesEmail = RuleSet<String>()
        groupRulesEmail.add(rule: RuleRequired() )
        groupRulesEmail.add(rule: RuleEmail() )
        
        var groupRulesText = RuleSet<String>()
        groupRulesText.add(rule: RuleRequired() )
        groupRulesText.add(rule: RuleMinLength(minLength: 2) )
        
        form
            +++ Section(header: "Dati utente", footer: "")
            <<< NameRow(FormItems.nome)
            { rowName in
                rowName.title = "Nome"
                rowName.placeholder = "..."
                rowName.add(ruleSet: groupRulesText)
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
            
            
            
            
            <<< NameRow(FormItems.cognome)
            { rowCognome in
                rowCognome.title = "Cognome"
                rowCognome.placeholder = "..."
                rowCognome.add(ruleSet: groupRulesText)
                rowCognome.validationOptions = .validatesOnChangeAfterBlurred
                }.onChange
                {
                    rowCognome in
                    self.cognome = rowCognome.value!
                    print(self.cognome)
                    rowCognome.updateCell()
                }.cellUpdate
                { cell , rowCognome in
                    if !rowCognome.isValid {
                        cell.titleLabel?.textColor = .red
                    }

            }
            
            
            +++ Section()
            <<< EmailRow(FormItems.email)
            { rowEmail in
                rowEmail.title = "Email"
                rowEmail.placeholder = "..."
                rowEmail.add(ruleSet: groupRulesEmail)
                rowEmail.validationOptions = .validatesOnChangeAfterBlurred
                }.onChange
                { rowEmail in
                    self.email = rowEmail.value!
                    print(self.email)
                    rowEmail.updateCell()
                }.cellUpdate
                { cell , rowEmail in
                    if !rowEmail.isValid {
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
            
            
            
            <<< PasswordRow()
                { confirmPassword in
                    confirmPassword.title = "conferma Password"
                    confirmPassword.add(rule: RuleEqualsToRow(form: form, tag: FormItems.password))
                }.cellUpdate
                { cell , confirmPassword in
                    if !confirmPassword.isValid {
                        cell.titleLabel?.textColor = .red
                    }
                }.cellUpdate
                { cell , confirmpassword in
                    if !confirmpassword.isValid {
                        cell.titleLabel?.textColor = .red
                    }

            }
            
            
            
            +++ Section()
            <<< IntRow(FormItems.telefono)
            { rowTelefono in
                rowTelefono.title = "Telefono"
                rowTelefono.placeholder = "..."
                }.onChange
                { rowTelefono in
                    self.telefono = rowTelefono.value!
                    print(self.telefono)
                    rowTelefono.updateCell()
                }.cellUpdate
                { cell , rowTelefono in
                    if !rowTelefono.isValid {
                        cell.titleLabel?.textColor = .red
                    }

            }
            
            
            
            
            
            <<< TextRow(FormItems.indirizzo)
            { rowIndirizzo in
                rowIndirizzo.title = "Indirizzo casa"
                rowIndirizzo.placeholder = "..."
                }.onChange
                {
                    rowIndirizzo in
                    self.indirizzo = rowIndirizzo.value!
                    print(self.indirizzo)
                    rowIndirizzo.updateCell()
                }.cellUpdate
                { cell , rowIndirizzo in
                    if !rowIndirizzo.isValid {
                        cell.titleLabel?.textColor = .red
                    }

            }
            
            
            
            
            +++ Section()
            +++ Section()
            +++ Section()
            +++ Section()
            +++ Section()
            +++ Section()
            +++ Section()
            +++ Section()
            +++ Section()
            <<< ButtonRow()
                {
                    bottone in
                    bottone.title = "Accedi"
                    bottone.presentationMode = .segueName(segueName: segueNames.registerToLogin, onDismiss: nil)
            }
            
            
            
            <<< ButtonRow()
                { bottone in
                    bottone.title = "Registrati"
                    
                }.onCellSelection
                { cell, bottone in
                    let error = bottone.section?.form?.validate()
                    if ((error != nil))
                    {
                        let parameters : Parameters = [
                            "utente_nome" : self.nome ,
                            "utente_cognome" : self.cognome ,
                            "utente_email" : self.email ,
                            "utente_password" : self.password]
                        
                        Alamofire.request(self.URL_USER_REGISTER , method: .post , parameters: parameters).responseString
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
                                    
                                    self.performSegue(withIdentifier: segueNames.registerToHi, sender: nil)
                                    

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

    
        
    } // viewDidLoad end
    


    

    
    
    
    
    
    
    

    
    
    
}

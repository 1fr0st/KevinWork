//
//  hiViewController.swift
//  aut0matedh0me
//
//  Created by kevin ngadiuba on 30/05/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import Eureka
import Alamofire


class hiViewController: FormViewController {

    
    struct segueNames
    {
        static let registerToLogin = "registerToLogin"
        static let loginToRegister = "loginToRegister"
        static let registerToHi = "registerToHi"
        static let hiToDashboard = "hiToDashboard"
    }
    
    var isRoom1visible : Bool = false
    var isRoom2visible : Bool = false
    var isRoom3visible : Bool = false
    var isRoom4visible : Bool = false
    var isRoom5visible : Bool = false
    var isRoom6visible : Bool = false
    var isRoom7visible : Bool = false
    
    var locationName : String = ""
    let locationSetupTrue : Int = 2
    let locationSetupFalse : Int = 1
    
   let URL_LOCATION = "http://1fr0st.it/setupRoom.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        

        form
            +++ Section(header : "Configurazione stanze" , footer: "scegli le stanze che possiedi")

            <<< SwitchRow() {
                stanza1 in
                stanza1.title = "Camera da letto"
                stanza1.value = false
                self.isRoom1visible = stanza1.value!
                print(self.isRoom1visible)
        }.onChange
                { stanza1 in
                    if (stanza1.value! == true)
                    {
                        self.locationName = stanza1.title!
                        self.isRoom1visible = stanza1.value!
                        print (self.isRoom1visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza1.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza1.title!
                        self.isRoom1visible = stanza1.value!
                        print (self.isRoom1visible)
                        

                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
       
            }
            <<< SwitchRow() {
                stanza2 in
                stanza2.title = "Bagno"
                stanza2.value = false
                self.isRoom2visible = stanza2.value!
                print(self.isRoom2visible)
                }.onChange
                { stanza2 in
                    if (stanza2.value! == true)
                    {
                        self.locationName = stanza2.title!
                        self.isRoom2visible = stanza2.value!
                        print (self.isRoom2visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza2.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza2.title!
                        self.isRoom2visible = stanza2.value!
                        print (self.isRoom2visible)
                        
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
                    
            }
            


            <<< SwitchRow() {
                stanza3 in
                stanza3.title = "Salotto"
                stanza3.value = false
                self.isRoom3visible = stanza3.value!
                print(self.isRoom3visible)
                }.onChange
                { stanza3 in
                    if (stanza3.value! == true)
                    {
                        self.locationName = stanza3.title!
                        self.isRoom3visible = stanza3.value!
                        print (self.isRoom3visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza3.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza3.title!
                        self.isRoom3visible = stanza3.value!
                        print (self.isRoom3visible)
                        
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
                    
            }
            
            
            
            
            <<< SwitchRow() {
                stanza4 in
                stanza4.title = "Camera degli ospiti"
                stanza4.value = false
                self.isRoom4visible = stanza4.value!
                print(self.isRoom4visible)
                }.onChange
                { stanza4 in
                    if (stanza4.value! == true)
                    {
                        self.locationName = stanza4.title!
                        self.isRoom4visible = stanza4.value!
                        print (self.isRoom4visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza4.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza4.title!
                        self.isRoom4visible = stanza4.value!
                        print (self.isRoom4visible)
                        
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
                    
            }

            
            
            
            <<< SwitchRow() {
                stanza5 in
                stanza5.title = "Corridoio"
                stanza5.value = false
                self.isRoom5visible = stanza5.value!
                print (self.isRoom5visible)
                }.onChange
                { stanza5 in
                    if (stanza5.value! == true)
                    {
                        self.locationName = stanza5.title!
                        self.isRoom5visible = stanza5.value!
                        print (self.isRoom5visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza5.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza5.title!
                        self.isRoom5visible = stanza5.value!
                        print (self.isRoom5visible)
                        
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
                    
            }
            

            <<< SwitchRow() {
                stanza6 in
                stanza6.title = "Cucina"
                stanza6.value = false
                self.isRoom6visible = stanza6.value!
                print (self.isRoom6visible)
                }.onChange
                { stanza6 in
                    if (stanza6.value! == true)
                    {
                        self.locationName = stanza6.title!
                        self.isRoom6visible = stanza6.value!
                        print (self.isRoom6visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza6.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza6.title!
                        self.isRoom6visible = stanza6.value!
                        print (self.isRoom6visible)
                        
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
                    
            }
            

            <<< SwitchRow() {
                stanza7 in
                stanza7.title = "Giardino"
                stanza7.value = false
                self.isRoom7visible = stanza7.value!
                print (isRoom7visible)
                }.onChange
                { stanza7 in
                    if (stanza7.value! == true)
                    {
                        self.locationName = stanza7.title!
                        self.isRoom7visible = stanza7.value!
                        print (self.isRoom7visible)
                        
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupTrue
                        ]
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters: parameters).responseString
                            {
                                response in
                                print (response)
                                
                        }
                    }
                    else if (stanza7.value! == false)
                    {
                        let parameters : Parameters = [
                            "location_name": self.locationName,
                            "location_setup" : self.locationSetupFalse
                        ]
                        
                        self.locationName = stanza7.title!
                        self.isRoom7visible = stanza7.value!
                        print (self.isRoom7visible)
                        
                        
                        Alamofire.request(self.URL_LOCATION , method: .post , parameters : parameters).responseString
                            {
                                response in
                                print (response)
                                
                                //                            var statusCode = response.response?.statusCode
                        }
                    }
                    
                    
            }
            
            
            
            
        
        
        <<< ButtonRow()
            { bottone in
                bottone.title = "Accedi alla dashboard"
                
                bottone.presentationMode = .segueName(segueName: segueNames.hiToDashboard, onDismiss: nil)
        }
        

            

        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! dashboardViewController
        destination.statusBottone1 = isRoom1visible
        destination.statusBottone2 = isRoom2visible
        destination.statusBottone3 = isRoom3visible
        destination.statusBottone4 = isRoom4visible
        destination.statusBottone5 = isRoom5visible
        destination.statusBottone6 = isRoom6visible
        destination.statusBottone7 = isRoom7visible
    }
    

}

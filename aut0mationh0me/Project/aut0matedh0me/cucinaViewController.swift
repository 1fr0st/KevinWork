//
//  cucinaViewController.swift
//  aut0matedh0me
//
//  Created by kevin ngadiuba on 31/05/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import Eureka
import Alamofire
import Async

class cucinaViewController: FormViewController {
    
    var nomeLocation : String = ""
    var primoDispositivo : String = ""
    var secondoDispositivo : String = ""
    var valorePrimoDispositivo : String = ""
    var valoreSecondoDispositivo : String = ""
    
    
    struct segueNamesv2
    {
        static let giardinoToDash = "giardinoToDash"
        static let cameraLettoToDash = "cameraLettoToDash"
        static let bagnoToDash = "bagnoToDash"
        static let cameraOspitiToDash = "cameraOspitiToDash"
        static let cucinaToDash = "cucinaToDash"
        static let corridoioToDash = "corridoioToDash"
        static let salottoToDash = "salottoToDash"
    }
    
    var locationName : String = ""
    var dispositivoName1 : String = ""
    var dispositivoName2 : String = ""
    let URL_REQUEST_NUMBER = "http://1fr0st.it/getRandom.php"
    let URL_REQUEST_DATA = "http://1fr0st.it/dispValue.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let group = AsyncGroup()
        
        group.enter()
        
        var parameters1 : Parameters = [
            "dispositivo_name" : primoDispositivo
        ]
        print (primoDispositivo)
        Alamofire.request(self.URL_REQUEST_DATA , method: .post , parameters: parameters1 ).responseData
            { response in
                print (response)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                self.valorePrimoDispositivo = text!
        }
        
        
        group.enter()
        
        var parameters2 : Parameters = [
            "dispositivo_name" : secondoDispositivo
        ]
        print (secondoDispositivo)
        Alamofire.request(self.URL_REQUEST_DATA , method: .post , parameters: parameters2 ).responseData
            { response in
                print (response)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                self.valoreSecondoDispositivo = text!
        }
        
        
        
        
        
        
        form
            +++ Section(header: "dati dei dispositivi in : \(nomeLocation)", footer: "")
            
            <<< TextRow()
                { row in
                    row.title = self.primoDispositivo
                    row.updateCell()
                    
                }.cellUpdate
                { cell , row in
                    row.value = self.valorePrimoDispositivo
                }.onCellSelection
                {
                    cell , row in
                    row.value = self.valorePrimoDispositivo
            }
            
            
            <<< TextRow()
                {row in
                    row.title = secondoDispositivo
                    row.updateCell()
                }.cellUpdate
                { cell , row in
                    row.value = self.valoreSecondoDispositivo
                }.onCellSelection
                {
                    cell , row in
                    row.value = self.valoreSecondoDispositivo
            }
            +++ Section()
            +++ Section()
            <<< ButtonRow()
                { bottone in
                    bottone.title = "Torna alla dashboard"
                    
                    bottone.presentationMode = .segueName(segueName: segueNamesv2.cucinaToDash, onDismiss: nil)
        }
        
        
        
        
        
        
    }
    
    
    
    
}


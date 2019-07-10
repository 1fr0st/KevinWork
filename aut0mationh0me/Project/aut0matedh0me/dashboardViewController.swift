//
//  dashboardViewController.swift
//  aut0matedh0me
//
//  Created by kevin ngadiuba on 30/05/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import Alamofire
import Async

class dashboardViewController: UIViewController {

    
    @IBOutlet var cameraDegliOspitiOutlet: UIButton! // 4
    @IBOutlet var bagnoOutlet: UIButton! // 2
    @IBOutlet var cameraDaLettoOutlet: UIButton! // 1
    @IBOutlet var giardinoOutlet: UIButton! // 7
    @IBOutlet var corridoioOutlet: UIButton!// 5
    @IBOutlet var salottoOutlet: UIButton! // 3
    @IBOutlet var cucinaOutlet: UIButton! // 6
    
    
    
    
    var statusBottone1 : Bool = false //camera da letto
    var statusBottone2 : Bool = false // bagno
    var statusBottone3 : Bool = false // salotto
    var statusBottone4 : Bool = false // camera degli ospiti
    var statusBottone5 : Bool = false // corridoio
    var statusBottone6 : Bool = false // cucina
    var statusBottone7 : Bool = false // giardino
    
    struct segueNames
    {
        static let giardinoToData = "giardinoToData"
        static let corridoioToData = "corridoioToData"
        static let salottoToData = "salottoToData"
        static let cucinaToData = "cucinaToData"
        static let bagnoToData = "bagnoToData"
        static let cameraLettoToData = "cameraLettoToData"
        static let cameraOspitiToData = "cameraOspitiToData"
    }
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
    
    struct listaDispositivi
    {
        // codici riferimento
        // 10 camera principale
        // 11 bagno
        // 12 camera ospiti
        // 13 cucina
        // 14 sala
        
        //dispositivi
        static let panasonicFX504 = "Panasonic TV FX504GD"
        static let termosifonePrincipale = "termosifone camera principale"
        static let iphonexsmax = "iphone xs max"
        static let termosifoneBagno = "termosifone bagno"
        static let lampadinaBagno = "lampadina bagno"
        static let termosifoneOspiti = "termosifone camera ospiti"
        static let samsungTVUH401 = "Samsung TV UH401"
        static let lampadinaOspiti = "lampadina camera ospiti"
        static let macchinaCaffeCucina = "Macchina caffe cucina"
        static let frigoriferoCucina = "Frigorifero cucina"
        static let lampadinaCucina = "lampadina cucina"
        static let sonyTVHQ1000 = "Sony TV HQ1000"
        static let impiantoAudioSony = "Impianto audio sony"
        static let genericTVsala = "generica tv sala"
    }
    
    var locationName : String = ""
    let URL_REQUEST = "http://1fr0st.it/initialRoom.php"

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// setup initial room status
        
        let group = AsyncGroup()
        // room1 group1
        group.enter()
        self.locationName = "Camera da letto"
        let parameters1 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters1).responseData
            { response in
                print (response)
               var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.cameraDaLettoOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.cameraDaLettoOutlet.isEnabled = false
                    }
                    
                }
                
                
                
                
        }
        
        
        // room2 group2
        group.enter()
        self.locationName = "Bagno"
        let parameters2 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters2).responseData
            { response in
                print (response)
                var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.bagnoOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.bagnoOutlet.isEnabled = false
                    }
                    
                }
       
        }
        
        // room3 group3
        group.enter()
        self.locationName = "Salotto"
        let parameters3 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters3).responseData
            { response in
                print (response)
                var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.salottoOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.salottoOutlet.isEnabled = false
                    }
                    
                }
     
        }
        
        // room4 group4
        group.enter()
        self.locationName = "Camera degli ospiti"
        let parameters4 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters4).responseData
            { response in
                print (response)
                var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.cameraDegliOspitiOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.cameraDegliOspitiOutlet.isEnabled = false
                    }
                    
                }
      
        }
        
        // room5 group5
        group.enter()
        self.locationName = "Corridoio"
        let parameters5 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters5).responseData
            { response in
                print (response)
                var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.corridoioOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.corridoioOutlet.isEnabled = false
                    }
                    
                }
       
        }
        
        // room6 group6
        group.enter()
        self.locationName = "Cucina"
        let parameters6 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters6).responseData
            { response in
                print (response)
                var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.cucinaOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.cucinaOutlet.isEnabled = false
                    }
                    
                }
     
        }
        
        // room7 group7
        group.enter()
        self.locationName = "Giardino"
        let parameters7 : Parameters = [
            "location_name" : self.locationName
        ]
        Alamofire.request(self.URL_REQUEST , method: .post , parameters: parameters7).responseData
            { response in
                print (response)
                var statusCode = response.response?.statusCode
                print (statusCode!)
                let data = response.data!
                print (data)
                let text = String(data : data , encoding: .utf8)
                print (text!)
                let dataInt = Int(text!)
                print (dataInt!)
                
                print (data)
                if statusCode == 210
                {
                    if dataInt == 2
                    {
                        self.giardinoOutlet.isEnabled = true
                    }
                    else if dataInt == 1
                    {
                        self.giardinoOutlet.isEnabled = false
                    }
                    
                }
                
                
                
                
        }
        
        
        
    
    } // end viewDidLoad
    
    
    
    @IBAction func cameraDegliOspitiButton(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.cameraOspitiToData, sender: nil)
        
    }
    
    @IBAction func bagnoButton(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.bagnoToData, sender: nil)
        
    }
    
    
    @IBAction func cameraDaLettoButton(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.cameraLettoToData, sender: nil)
        
    }
    
    @IBAction func Giardino(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.giardinoToData, sender: nil)
        
    }
    
    @IBAction func CorridoioButton(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.corridoioToData, sender: nil)
        
        
    }
    
    @IBAction func SalottoButton(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.salottoToData, sender: nil)
        
        
    }
    
    @IBAction func cucinaButton(_ sender: Any) {
        self.performSegue(withIdentifier: segueNames.cucinaToData, sender: nil)
        
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueNames.bagnoToData
        {
            let destination = segue.destination as! bagnoViewController
            destination.nomeLocation = bagnoOutlet.currentTitle!
            destination.primoDispositivo = listaDispositivi.termosifoneBagno
            destination.secondoDispositivo = listaDispositivi.lampadinaBagno
        }
        
        
        if segue.identifier == segueNames.cameraLettoToData
        {
            let destination = segue.destination as! cameraLettoViewController
            destination.nomeLocation = cameraDaLettoOutlet.currentTitle!
            destination.primoDispositivo = listaDispositivi.panasonicFX504
            destination.secondoDispositivo = listaDispositivi.termosifonePrincipale
        }
        
        
        if segue.identifier == segueNames.cameraOspitiToData
        {
            let destination = segue.destination as! cameraOspitiViewController
            destination.nomeLocation = cameraDegliOspitiOutlet.currentTitle!
            destination.primoDispositivo = listaDispositivi.samsungTVUH401
            destination.secondoDispositivo = listaDispositivi.termosifoneOspiti
        }
        
        
        if segue.identifier == segueNames.corridoioToData
        {
            let destination = segue.destination as! corridoioViewController
            destination.nomeLocation = corridoioOutlet.currentTitle!
            destination.primoDispositivo = "nessun dispositivo disponibile"
            destination.secondoDispositivo = "nessuno dispositivo disponibile"
        }
        
        
        if segue.identifier == segueNames.cucinaToData
        {
            let destination = segue.destination as! cucinaViewController
            destination.nomeLocation = cucinaOutlet.currentTitle!
            destination.primoDispositivo = listaDispositivi.frigoriferoCucina
            destination.secondoDispositivo = listaDispositivi.sonyTVHQ1000
        }
        
        
        if segue.identifier == segueNames.giardinoToData
        {
            let destination = segue.destination as! giardinoViewController
            destination.nomeLocation = giardinoOutlet.currentTitle!
            destination.primoDispositivo = "nessun dispositivo disponibile"
            destination.secondoDispositivo = "nessun dispositivo disponibile"
        }
        
        
        if segue.identifier == segueNames.salottoToData
        {
            let destination = segue.destination as! salottoViewController
            destination.nomeLocation = salottoOutlet.currentTitle!
            destination.primoDispositivo = listaDispositivi.genericTVsala
            destination.secondoDispositivo = "nessun dispositivo disponibile"
        }
        
        
    }
    
    
    
    
    
    
    
}

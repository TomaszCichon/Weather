//
//  ViewController.swift
//  Weather
//
//  Created by tc on 24.11.2017.
//  Copyright © 2017 tc. All rights reserved.
//

import UIKit



struct Stacje: Decodable {
    let id: Int
    let stationName: String
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlPath = "http://api.gios.gov.pl/pjp-api/rest/station/findAll"
        guard let url = URL(string: urlPath) else { return print("problem1") }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
       
            guard let importedData = data else { return print("problem2") }
            
            do {
                let stacje = try
                    JSONDecoder().decode([Stacje].self, from: importedData)
                print(stacje[0])
                
            } catch {
                print("Error")
            }
            
            
            }.resume()
        
    }
    
}












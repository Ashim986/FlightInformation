//
//  Service.swift
//  DisplayFlightInformation
//
//  Created by ashim Dahal on 10/10/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import Foundation

struct Service  {
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(searchObject : String ,completion: @escaping (FlightDataInformation?,Error?)->()) {
        
//       Base URL
        guard let url = URL(string: "https://api.qa.alaskaair.com/1/airports/\(searchObject)/flights/flightInfo?city=\(searchObject)&minutesBehind=10&minutesAhead=120") else {return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM= ", forHTTPHeaderField: "Authorization")
        
//        making the request
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            guard let data = data else {return}
            do {
                let dataFromFlight  = try JSONDecoder().decode([FlightDataInformation].self, from: data)
                for dataInFile in dataFromFlight{
                    completion(dataInFile, nil)
                }
            }catch let err {
                completion(nil, err)
            }
            
            }.resume()
        
    }
    
}

//
//  ViewController.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class FlightSearchViewController: UIViewController {
    
    var flightData = [FlightDataInformation]()
    
    
    let informationLabel : UILabel = {
       let label = UILabel()
        label.text = "Please enter three digit airport code to find information about flight detail"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textFieldForAirportCode : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Enter Code"
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var searchButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.backgroundColor = #colorLiteral(red: 0.4170642594, green: 0.8991251538, blue: 0.35213355, alpha: 0.7429901541)
        button.addTarget(self, action: #selector(handelSearchButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        view.addSubview(informationLabel)
        view.addSubview(textFieldForAirportCode)
        view.addSubview(searchButton)
        anchroForView()
    }
    
    func anchroForView()  {
        // x, y , Height , Width Anchor
     
        
      
        NSLayoutConstraint.activate([informationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     informationLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant : 100),
                                     informationLabel.widthAnchor.constraint(equalTo : view.widthAnchor , constant : -20),
                                     informationLabel.heightAnchor.constraint(equalToConstant: 60),
                                     ])
        NSLayoutConstraint.activate([textFieldForAirportCode.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     textFieldForAirportCode.centerYAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant : 50),
                                     textFieldForAirportCode.widthAnchor.constraint(equalToConstant : 200),
                                     textFieldForAirportCode.heightAnchor.constraint(equalToConstant: 50),
                                     ])
        NSLayoutConstraint.activate([searchButton.centerXAnchor.constraint(equalTo: textFieldForAirportCode.centerXAnchor),
                                     searchButton.topAnchor.constraint(equalTo: textFieldForAirportCode.bottomAnchor, constant : 25),
                                     searchButton.widthAnchor.constraint(equalToConstant : 75),
                                     searchButton.heightAnchor.constraint(equalToConstant: 35),
                                     ])
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handelSearchButton(){
    
        if let destinationCity = textFieldForAirportCode.text {
        
            loadDataFromService(destination: destinationCity)
            let flightInformationList = UINavigationController(rootViewController: FlightInformationList())
            present(flightInformationList, animated: true, completion: nil)
        }
        
    }
    
    func loadDataFromService (destination: String)  {
        
        guard let url = URL(string: "https://api.qa.alaskaair.com/1/airports/\(destination)/flights/flightInfo?city=\(destination)&minutesBehind=10&minutesAhead=120") else {return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic YWFnZTQxNDAxMjgwODYyNDk3NWFiYWNhZjlhNjZjMDRlMWY6ODYyYTk0NTFhYjliNGY1M2EwZWJiOWI2ZWQ1ZjYwOGM= ", forHTTPHeaderField: "Authorization")
        
        //making the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            do {
                self.flightData = try JSONDecoder().decode([FlightDataInformation].self, from: data)
                print(self.flightData)
                
            }catch let jsonErr{
                print(jsonErr)
            }
            
            }.resume()
        
    }
    func addingforPrinting(json : Any)  {
        let decodedValue = json
        
        print(decodedValue)
    }
    
}



//                let dataAsString = String(data: data, encoding: .utf8)
//                print(dataAsString!)
//
//                swift 2
//
//                let data = self.[FlightInfo]
//
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : Any]] else {return}
//
//                self.flightInfo = json.map{FlightInfo(json: $0)}






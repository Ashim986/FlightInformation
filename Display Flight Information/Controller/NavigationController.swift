//
//  NavigationController.swift
//  DisplayFlightInformation
//
//  Created by ashim Dahal on 10/12/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class NavigationController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        if isInPresentViewController(){
            
            perform(#selector(showFlightSearchViewController), with: nil, afterDelay: 0.01)

        }
        else{
            perform(#selector(showFlightInformationList), with: nil, afterDelay: 0.01)
        }
    }
   
    func isInPresentViewController() -> Bool{
        
        return UserDefaults.standard.bool(forKey: "isInPresentViewController")
    }
    
   @objc func showFlightSearchViewController()  {

    
        let flightSearchViewController = FlightSearchViewController()
    flightSearchViewController.textFieldForAirportCode.text =  UserDefaults.standard.value(forKey: "searchKey") as? String
    
    present(flightSearchViewController, animated: true, completion: nil)
    }
    @objc func showFlightInformationList(){
        
        let flightInformationList = FlightInformationList()
        if !isInPresentViewController() {
            
           flightInformationList.searchKey = UserDefaults.standard.value(forKey: "searchKey") as! String
        }
    
        let navigationController = UINavigationController(rootViewController: flightInformationList)
        
        present(navigationController, animated: true, completion: nil)
    }
}

//
//  FlightInformationList.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class FlightInformationList: UITableViewController {
    
    let cellID = "cellID"
    var flightInformationDetail = [FlightDataInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackButton))
    }
    
    @objc func handleBackButton(){
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightInformationDetail.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FlightDisplayCell
        let flightData = flightInformationDetail[indexPath.row]
        cell?.textLabel?.text = flightData.Dest
        cell?.detailTextLabel?.text = flightData.EstArrTime
        
        return cell!
    }
    
}

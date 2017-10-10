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
        navigationItem.title = "Flight Information Detail"
        tableView.register(FlightDisplayCell.self, forCellReuseIdentifier: cellID)
    }
    
    @objc func handleBackButton(){
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FlightDisplayCell
//        cell?.textLabel?.text = "Ashim"
//        cell?.detailTextLabel?.text = "This is new requirement"
        return cell!
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = displayHeaderList()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

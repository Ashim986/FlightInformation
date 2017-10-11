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
    var flightDisplay = [FlightDataInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.title = "Flight Information Detail"
        tableView.register(FlightDisplayCell.self, forCellReuseIdentifier: cellID)
       
        fetchFlightData()
        
    }
    func fetchFlightData(){
        
        Service.sharedInstance.fetchHomeFeed { (flightDataInformation, err) in
            if let err = err{
                print(err)
                return
            }
            if let flightDataInfo = flightDataInformation {
                self.flightDisplay.append(flightDataInfo)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    @objc func handleBackButton(){
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightDisplay.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? FlightDisplayCell
        
        let dataInFlight = flightDisplay[indexPath.row]
        
        let estimatedArrivalTime = Utility.formatDate(dateValue: dataInFlight.EstArrTime, destinationOffset: dataInFlight.DestZuluOffset, originOffset: dataInFlight.OrigZuluOffset , currentTime: Date())
        let scheduledArrivalTime = Utility.formatDate(dateValue: dataInFlight.SchedArrTime, destinationOffset: dataInFlight.DestZuluOffset, originOffset: dataInFlight.OrigZuluOffset, currentTime: Date())
        if (estimatedArrivalTime != nil) && (scheduledArrivalTime != nil){
            
            cell?.cellSerialNumberLabel.text = "\(indexPath.row + 1)"
            cell?.cellFlightIDLabel.text = dataInFlight.FltId
            cell?.cellOriginLabel.text = dataInFlight.Orig
            cell?.cellDestinationLabel.text = dataInFlight.Dest
            cell?.cellScheduleArrivalTimeLabel.text = scheduledArrivalTime
            cell?.cellEstimatedArrivalTimeLabel.text = estimatedArrivalTime
            
        }
        
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

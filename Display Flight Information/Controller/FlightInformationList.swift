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
    var searchKey = ""
    var flightDisplay = [FlightDataInformation]()
    var scheduleList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.title = "Flight Information Detail"
        tableView.register(FlightDisplayCell.self, forCellReuseIdentifier: cellID)
        tableView.reloadData()
        fetchFlightData()

    }
    func fetchFlightData(){
        
        // response form service
        Service.sharedInstance.fetchHomeFeed(searchObject: searchKey) { (flightDataInformation, err) in
            if let err = err{
                print(err)
                return
            }
            if let flightDataInfo = flightDataInformation {
                
                let scheduleArrivalTime = Utility.formatDateForScheduleArrivalTime(scheduleArrivalTime:flightDataInfo.SchedArrTime, destinationOffset:flightDataInfo.DestZuluOffset)
                
                if (scheduleArrivalTime != nil)
                {
                    self.scheduleList.append(scheduleArrivalTime!)
                  self.flightDisplay.append(flightDataInfo)
                }
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
        
        let flightData = flightDisplay[indexPath.row]
        let estimatedArrivalTime = Utility.formatDateForEstimateArrivalTime(estimateArrivalTime:flightData.EstArrTime, destinationOffset:flightData.DestZuluOffset)
        let scheduleArrivalTime = scheduleList.sorted()[indexPath.row]
        
        cell?.cellSerialNumberLabel.text = "\(indexPath.row + 1)"
        cell?.cellFlightIDLabel.text = flightData.FltId
        cell?.cellOriginLabel.text = flightData.Orig
        cell?.cellEstimatedArrivalTimeLabel.text = estimatedArrivalTime
        cell?.cellScheduleArrivalTimeLabel.text = scheduleArrivalTime
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

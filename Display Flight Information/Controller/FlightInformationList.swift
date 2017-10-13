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
    var estimatedList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.title = "Flight Information Detail"
        tableView.register(FlightDisplayCell.self, forCellReuseIdentifier: cellID)
        tableView.reloadData()
        fetchFlightData()

    }
    override func viewWillAppear(_ animated: Bool) {
        
        let flightSearchViewController = FlightSearchViewController()
        flightSearchViewController.textFieldForAirportCode.text = searchKey
        
        UserDefaults.standard.set(false, forKey: "isInPresentViewController")
        UserDefaults.standard.synchronize()
      
    }
    func fetchFlightData(){
        
        // response form service
        Service.sharedInstance.fetchHomeFeed(searchObject: searchKey) { (flightDataInformation, err) in
            if let err = err{
                print(err)
                return
            }
            if let flightDataInfo = flightDataInformation {
                
                let estimatedArrivalTime = Utility.formatDateForEstimatedArrivalTime(scheduleArrivalTime:flightDataInfo.EstArrTime, destinationOffset:flightDataInfo.DestZuluOffset)
                
                if (estimatedArrivalTime != nil)
                {
                    self.estimatedList.append(estimatedArrivalTime!)
                  self.flightDisplay.append(flightDataInfo)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    @objc func handleBackButton(){
        
        let flightSearchViewController = FlightSearchViewController()
        flightSearchViewController.textFieldForAirportCode.text = searchKey
        
        present(flightSearchViewController, animated: true, completion: nil)
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
        let scheduleArrivalTime = Utility.formatDateForScheduleArrivalTime(estimateArrivalTime:flightData.SchedArrTime, destinationOffset:flightData.DestZuluOffset)
        let estimatedArrivalTime = estimatedList.sorted()[indexPath.row]
        
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

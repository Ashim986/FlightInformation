//
//  FlightDisplayCell.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class  FlightDisplayCell: UITableViewCell {
    
    var flightDataItem: Any? {
        didSet {
            guard let flightDataInfo = flightDataItem as? FlightDataInformation else {
                return
            }
            cellFlightIDLabel.text = flightDataInfo.FltId
            cellOriginLabel.text = flightDataInfo.Orig
            cellDestinationLabel.text = flightDataInfo.Dest
            cellScheduleArrivalTimeLabel.text = flightDataInfo.SchedArrTime
            cellEstimatedArrivalTimeLabel.text = flightDataInfo.EstArrTime
        }
    }
    // CellLabel for table view
    let cellSerialNumberLabel = Utility.customLabel(lblTitle: "S/N")
    let cellFlightIDLabel = Utility.customLabel(lblTitle: "Flight ID")
    let cellOriginLabel  = Utility.customLabel(lblTitle: "Origin")
    let cellDestinationLabel  = Utility.customLabel(lblTitle: "Destination")
    let cellScheduleArrivalTimeLabel  = Utility.customLabel(lblTitle: "Sched Arrival Time")
    let cellEstimatedArrivalTimeLabel  = Utility.customLabel(lblTitle:"Est Arrival Time")
    
    // Cell for stack view
    let cellSerialNumberView = UIView()
    let cellFlightIDView = UIView()
    let cellOriginView = UIView()
    let cellDestinationView = UIView()
    let cellScheduleArrivalTimeView = UIView()
    let cellEstimatedArrivalTime = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default , reuseIdentifier: reuseIdentifier)
        
        let displayInformationLabelStackViewForCell = UIStackView(arrangedSubviews: [cellSerialNumberView, cellFlightIDView, cellOriginView, cellDestinationView,cellScheduleArrivalTimeView, cellEstimatedArrivalTime])
        displayInformationLabelStackViewForCell.axis = .horizontal
        displayInformationLabelStackViewForCell.distribution = .fillEqually
        displayInformationLabelStackViewForCell.translatesAutoresizingMaskIntoConstraints = false
        
        // add sub view to table cell
        addSubview(displayInformationLabelStackViewForCell)
        addSubview(cellSerialNumberLabel)
        addSubview(cellFlightIDLabel)
        addSubview(cellOriginLabel)
        addSubview(cellDestinationLabel)
        addSubview(cellScheduleArrivalTimeLabel)
        addSubview(cellEstimatedArrivalTimeLabel)
        
        // layout for Stack View
        NSLayoutConstraint.activate([displayInformationLabelStackViewForCell.leadingAnchor.constraint(equalTo: self.leadingAnchor), displayInformationLabelStackViewForCell.topAnchor.constraint(equalTo: self.topAnchor),displayInformationLabelStackViewForCell.widthAnchor.constraint(equalTo :self.widthAnchor), displayInformationLabelStackViewForCell.heightAnchor.constraint(equalTo : self.heightAnchor)])
        
        anchorlayoutViewForCell()
    }
    
    func anchorlayoutViewForCell()  {
        
        Utility.anchorForLayout(textLabel: cellSerialNumberLabel, textLabelView: cellSerialNumberView)
        Utility.anchorForLayout(textLabel: cellFlightIDLabel, textLabelView: cellFlightIDView)
        Utility.anchorForLayout(textLabel: cellOriginLabel, textLabelView: cellOriginView)
        Utility.anchorForLayout(textLabel: cellDestinationLabel, textLabelView: cellDestinationView)
        Utility.anchorForLayout(textLabel: cellScheduleArrivalTimeLabel, textLabelView: cellScheduleArrivalTimeView)
        Utility.anchorForLayout(textLabel: cellEstimatedArrivalTimeLabel, textLabelView: cellEstimatedArrivalTime)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

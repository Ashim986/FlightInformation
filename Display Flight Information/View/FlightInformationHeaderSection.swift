//
//  FlightInformationHeaderSection.swift
//  DisplayFlightInformation
//
//  Created by ashim Dahal on 10/10/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

extension FlightInformationList{
    
    func displayHeaderList () -> UIView{
        
        let serialNumberLabel = Utility.customHeaderLabel(lblTitle: "S/N")
        let flightIDLabel = Utility.customHeaderLabel(lblTitle: "Flight ID")
        let originLabel : UILabel = Utility.customHeaderLabel(lblTitle: "Origin")
        let scheduleArrivalTimeLabel : UILabel = Utility.customHeaderLabel(lblTitle: "Sched Arrival Time")
        let estimatedArrivalTimeLabel : UILabel = Utility.customHeaderLabel(lblTitle:"Est Arrival Time")
        
        let serialNumberView = UIView()
        let flightIDView = UIView()
        let originView = UIView()
        let scheduleArrivalTimeView = UIView()
        let estimatedArrivalTime = UIView()
        
        let displayInformationLabelStackView = UIStackView(arrangedSubviews: [serialNumberView, flightIDView, originView,scheduleArrivalTimeView, estimatedArrivalTime])
        displayInformationLabelStackView.axis = .horizontal
        displayInformationLabelStackView.distribution = .fillEqually
        displayInformationLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(serialNumberLabel)
        view.addSubview(flightIDLabel)
        view.addSubview(originLabel)
        view.addSubview(scheduleArrivalTimeLabel)
        view.addSubview(estimatedArrivalTimeLabel)
        view.addSubview(displayInformationLabelStackView)
        // Anchor For Stack Views and Label
        // x,y, height and width
        NSLayoutConstraint.activate([displayInformationLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), displayInformationLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),displayInformationLabelStackView.widthAnchor.constraint(equalTo :view.widthAnchor), displayInformationLabelStackView.heightAnchor.constraint(equalToConstant: 30)])
        
        // label Anchor
        Utility.anchorForLayout(textLabel: serialNumberLabel, textLabelView: serialNumberView)
        Utility.anchorForLayout(textLabel: flightIDLabel, textLabelView: flightIDView)
        Utility.anchorForLayout(textLabel: originLabel, textLabelView: originView)
        Utility.anchorForLayout(textLabel: scheduleArrivalTimeLabel, textLabelView: scheduleArrivalTimeView)
        Utility.anchorForLayout(textLabel: estimatedArrivalTimeLabel, textLabelView: estimatedArrivalTime)
        return displayInformationLabelStackView 
    }
}

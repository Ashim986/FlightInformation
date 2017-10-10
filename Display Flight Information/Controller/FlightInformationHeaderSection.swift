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
    let serialNumberLabel : UILabel = {
            let label =  UILabel()
            label.text = "S/N"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 2
            label.textAlignment = .left
            label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.white.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let flightIDLabel : UILabel = {
            let label =  UILabel()
            label.text = "Flight ID"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 2
            label.textAlignment = .left
            label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.white.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let originLabel : UILabel = {
            let label =  UILabel()
            label.text = "Origin"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 2
            label.textAlignment = .left
            label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.white.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let destinationLabel : UILabel = {
            let label =  UILabel()
            label.text = "Destination"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 2
            label.textAlignment = .left
            label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.white.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let scheduleArrivalTimeLabel : UILabel = {
            let label =  UILabel()
            label.text = "Sched Arrival Time"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 2
            label.textAlignment = .left
            label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.white.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let estimatedArrivalTimeLabel : UILabel = {
            let label =  UILabel()
            label.text = "Est Arrival Time"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 2
            label.textAlignment = .left
            label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.white.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
   
    let serialNumberView = UIView()
    let flightIDView = UIView()
    let originView = UIView()
    let destinationView = UIView()
    let scheduleArrivalTimeView = UIView()
    let estimatedArrivalTime = UIView()
    
    let displayInformationLabelStackView = UIStackView(arrangedSubviews: [serialNumberView, flightIDView, originView, destinationView,scheduleArrivalTimeView, estimatedArrivalTime])
    displayInformationLabelStackView.axis = .horizontal
    displayInformationLabelStackView.distribution = .fillEqually
    displayInformationLabelStackView.translatesAutoresizingMaskIntoConstraints = false
    
    
    view.addSubview(serialNumberLabel)
    view.addSubview(flightIDLabel)
    view.addSubview(originLabel)
    view.addSubview(destinationLabel)
    view.addSubview(scheduleArrivalTimeLabel)
    view.addSubview(estimatedArrivalTimeLabel)
    view.addSubview(displayInformationLabelStackView)
    // Anchor For Stack Views and Label
    // x,y, height and width
    NSLayoutConstraint.activate([displayInformationLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), displayInformationLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),displayInformationLabelStackView.widthAnchor.constraint(equalTo :view.widthAnchor), displayInformationLabelStackView.heightAnchor.constraint(equalToConstant: 30)])
    
    
    // label Anchor
    
    NSLayoutConstraint.activate([serialNumberLabel.leadingAnchor.constraint(equalTo: serialNumberView.leadingAnchor, constant : 2), serialNumberLabel.trailingAnchor.constraint(equalTo: serialNumberView.trailingAnchor, constant : -2),serialNumberLabel.widthAnchor.constraint(equalTo :serialNumberView.widthAnchor), serialNumberLabel.heightAnchor.constraint(equalTo: serialNumberView.heightAnchor)])
    
    NSLayoutConstraint.activate([flightIDLabel.leadingAnchor.constraint(equalTo: flightIDView.leadingAnchor, constant : 2), flightIDLabel.trailingAnchor.constraint(equalTo: flightIDView.trailingAnchor, constant : -2),flightIDLabel.widthAnchor.constraint(equalTo :flightIDView.widthAnchor), flightIDLabel.heightAnchor.constraint(equalTo: flightIDView.heightAnchor)])
    
    NSLayoutConstraint.activate([originLabel.leadingAnchor.constraint(equalTo: originView.leadingAnchor, constant : 2), originLabel.trailingAnchor.constraint(equalTo: originView.trailingAnchor, constant : -2),originLabel.widthAnchor.constraint(equalTo :originView.widthAnchor), originLabel.heightAnchor.constraint(equalTo: originView.heightAnchor)])
    
    NSLayoutConstraint.activate([destinationLabel.leadingAnchor.constraint(equalTo: destinationView.leadingAnchor,constant : 2), destinationLabel.trailingAnchor.constraint(equalTo: destinationView.trailingAnchor, constant : -2),destinationLabel.widthAnchor.constraint(equalTo :destinationView.widthAnchor), destinationLabel.heightAnchor.constraint(equalTo: destinationView.heightAnchor)])
    
    NSLayoutConstraint.activate([scheduleArrivalTimeLabel.leadingAnchor.constraint(equalTo: scheduleArrivalTimeView.leadingAnchor, constant : 2), scheduleArrivalTimeLabel.trailingAnchor.constraint(equalTo: scheduleArrivalTimeView.trailingAnchor, constant : -2),scheduleArrivalTimeLabel.widthAnchor.constraint(equalTo :scheduleArrivalTimeView.widthAnchor), scheduleArrivalTimeLabel.heightAnchor.constraint(equalTo: scheduleArrivalTimeView.heightAnchor)])
    
    NSLayoutConstraint.activate([estimatedArrivalTimeLabel.leadingAnchor.constraint(equalTo: estimatedArrivalTime.leadingAnchor, constant : 2), estimatedArrivalTimeLabel.trailingAnchor.constraint(equalTo: estimatedArrivalTime.trailingAnchor, constant : -2),estimatedArrivalTimeLabel.widthAnchor.constraint(equalTo :estimatedArrivalTime.widthAnchor), estimatedArrivalTimeLabel.heightAnchor.constraint(equalTo: estimatedArrivalTime.heightAnchor)])
   
    
    return displayInformationLabelStackView 
    }
}

//
//  Utility.swift
//  DisplayFlightInformation
//
//  Created by ashim Dahal on 10/10/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class Utility: NSObject {
//     label for table view cell
    class func customLabel(lblTitle : String) -> UILabel{
        let label =  UILabel()
        label.text = lblTitle
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
//    uilabel for table view header
    class func customHeaderLabel(lblTitle : String) -> UILabel{
        let label =  UILabel()
        label.text = lblTitle
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
//    anchor for table view cell and label
    class func anchorForLayout(textLabel : UILabel , textLabelView : UIView){
        
        NSLayoutConstraint.activate([textLabel.leadingAnchor.constraint(equalTo: textLabelView.leadingAnchor), textLabel.trailingAnchor.constraint(equalTo: textLabelView.trailingAnchor),textLabel.widthAnchor.constraint(equalTo :textLabelView.widthAnchor), textLabel.heightAnchor.constraint(equalTo: textLabelView.heightAnchor)])
        
    }
//    calculate Date and convert to standard format and send time less than 10 min ago
    class func formatDateForScheduleArrivalTime(scheduleArrivalTime :String?, destinationOffset : String?)-> String?{
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
     
        guard let UTCDestination = destinationOffset else {
            return nil
        }
        let UTCTimeDifference = Int(UTCDestination)! + 7 // 7 is UTC Time difference with Seattle
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
        let evaluatedDate : Date? = dateFormatter.date(from: scheduleArrivalTime!)
        let dateWithOffsetValue = calendar.date(byAdding: .hour, value: UTCTimeDifference, to: evaluatedDate!)
        let differenceInMin = (dateWithOffsetValue?.timeIntervalSince(currentTime))! / 60
        if differenceInMin > -10 {
            let dateFormatter2 = dateFormatter
            dateFormatter2.dateFormat = "hh:mm a"
            let dateValue = dateFormatter.string(from: dateWithOffsetValue!)
            return String(describing : dateValue)
        }
        else{
            
            return nil
        }
    }
    
    class func formatDateForEstimateArrivalTime(estimateArrivalTime :String?, destinationOffset : String?)-> String?{
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        guard let UTCDestination = destinationOffset else {
            return nil
        }
        let UTCTimeDifference = Int(UTCDestination)! + 7 // 7 is UTC Time difference with Seattle
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss"
        let evaluatedDate : Date? = dateFormatter.date(from: estimateArrivalTime!)
        let dateWithOffsetValue = calendar.date(byAdding: .hour, value: UTCTimeDifference, to: evaluatedDate!)
            let dateFormatter2 = dateFormatter
            dateFormatter2.dateFormat = "hh:mm a"
            let dateValue = dateFormatter.string(from: dateWithOffsetValue!)
            return String(describing : dateValue)
    }
    
    class func sortArrayOfStruct(flightDataArray : [FlightDataInformation])->[FlightDataInformation]{
        
        let unorderedData = flightDataArray[0]
        let orderedData = flightDataArray.sorted {_,_ in
            let s1 = unorderedData.SchedArrTime
            let s2 = unorderedData.SchedArrTime
            return s1 > s2
        }
        return orderedData
    }
    
}


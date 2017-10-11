//
//  Utility.swift
//  DisplayFlightInformation
//
//  Created by ashim Dahal on 10/10/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
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
    
    class func anchorForLayout(textLabel : UILabel , textLabelView : UIView){
        
        NSLayoutConstraint.activate([textLabel.leadingAnchor.constraint(equalTo: textLabelView.leadingAnchor), textLabel.trailingAnchor.constraint(equalTo: textLabelView.trailingAnchor),textLabel.widthAnchor.constraint(equalTo :textLabelView.widthAnchor), textLabel.heightAnchor.constraint(equalTo: textLabelView.heightAnchor)])
        
    }
    
    
    class func formatDate(dateValue :String, destinationOffset : String , originOffset: String, currentTime : Date)-> String?{
        var evaluatedDate = dateValue
        let currentTime = currentTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss "
        let calendar = Calendar.current
        
        if let previousDateFormated : Date = dateFormatter.date(from: evaluatedDate)
        {
            var hour = calendar.component(.hour, from: previousDateFormated)
            hour = hour - Int(destinationOffset)! + Int(originOffset)!
            let minute = calendar.component(.minute, from: previousDateFormated)
         
            let difference =   previousDateFormated.timeIntervalSince(currentTime) / (60)
            if difference > -10 {
                if hour >= 12 && minute >= 0 {
                    if hour == 12 {
                        evaluatedDate = "\(hour):\(minute) PM"
                        return evaluatedDate
                    }else{
                        evaluatedDate = "\(hour - 12):\(minute) PM"
                        return evaluatedDate
                    }
                    
                }else {
                    evaluatedDate = "\(hour):\(minute) AM"
                    return evaluatedDate
                }
            }
            return nil
            }
        else{
            return nil
        }
            
    }
    
}


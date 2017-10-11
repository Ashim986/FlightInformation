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
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .left
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    class func anchorForLayout(textLabel : UILabel , textLabelView : UIView){
        
        NSLayoutConstraint.activate([textLabel.leadingAnchor.constraint(equalTo: textLabelView.leadingAnchor), textLabel.trailingAnchor.constraint(equalTo: textLabelView.trailingAnchor),textLabel.widthAnchor.constraint(equalTo :textLabelView.widthAnchor), textLabel.heightAnchor.constraint(equalTo: textLabelView.heightAnchor)])
        
    }
}


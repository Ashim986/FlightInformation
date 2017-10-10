//
//  FlightDisplayCell.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class  FlightDisplayCell: UITableViewCell {
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 64, y: (textLabel?.frame.origin.y)! - 2, width: frame.width, height: (textLabel?.frame.height)!)
        detailTextLabel?.frame = CGRect(x: 64, y: (detailTextLabel?.frame.origin.y)! + 2, width: frame.width, height: (detailTextLabel?.frame.height)!)
        
    }
    
    
}

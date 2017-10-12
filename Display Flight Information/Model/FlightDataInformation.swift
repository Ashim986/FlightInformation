//
//  FlightInformationDetail.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class FlightDataInformation : Decodable {
    var FltId : String
    var Orig : String
    var Dest : String
    var SchedArrTime : String
    var EstArrTime : String
    var DestZuluOffset : String
    
}

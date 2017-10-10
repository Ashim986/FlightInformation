//
//  FlightInformationDetail.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

struct FlightDataInformation : Decodable {
    let FltId : String
    let Orig : String
    let Dest : String
    let SchedArrTime : String
    let EstArrTime : String
    let DestZuluOffset : String
    
}

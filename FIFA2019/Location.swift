//
//  Location.swift
//  FIFA2019
//
//  Created by Mitali Ahir on 2019-07-09.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import Foundation

class Location
{
    var stadium: String = ""
    var city: String = ""
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    
    init(stadium: String, city: String, longitude: Double, latitude: Double)
    {
        self.stadium = stadium
        self.city = city
        self.longitude = longitude
        self.latitude = latitude
    
    }
}

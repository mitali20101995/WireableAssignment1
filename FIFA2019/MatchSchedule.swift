//
//  MatchSchedule.swift
//  FIFA2019
//
//  Created by Mitali Ahir on 2019-07-05.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import Foundation

class MatchSchedule
{
    var type: String = ""
    var date: String = ""
    var time: String = ""
    var teamA: Team
    var teamB: Team
    var location: Location
    
    init(type:String, date: String, time: String, teamA: Team,teamB: Team, location: Location)
    {
        self.type = type
        self.date = date
        self.time = time
        self.teamA = teamA
        self.teamB = teamB
        self.location = location
    }
}


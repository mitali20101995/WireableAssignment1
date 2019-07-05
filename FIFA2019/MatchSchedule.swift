//
//  MatchSchedule.swift
//  FIFA2019
//
//  Created by Siddharth Trivedi on 2019-07-05.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import Foundation


class MatchScedule: Codable
{
    let matchType: String
    let teamFlagA: String
    let teamA: String
    let matchDate: String
    let matchTime: String
    let teamB: String
    let teamFlagB: String
    
    init(matchType: String, teamFlagA: String, teamA: String, matchDate: String, matchTime: String, teamB: String, teamFlagB: String)
    {
        self.matchType = matchType
        self.matchDate = matchDate
        self.matchTime = matchTime
        self.teamA = teamA
        self.teamB = teamB
        self.teamFlagA = teamFlagA
        self.teamFlagB = teamFlagB
    }
    
   
    let schedule = MatchScedule(matchType: "Final", teamFlagA: "🏴󠁧󠁢󠁥󠁮󠁧󠁿", teamA: "England", matchDate: "Jul 7,2019", matchTime: "11:00", teamB: "USA", teamFlagB: "🇺🇸")
    
    let encoder = JSONEncoder()
    let data = try encoder.encode(schedule)
    let jsonString = String(data: data, encoding: .utf8)
    print(jsonString ?? "")
    
    let decoder = JSONDecoder()
    let match = try decoder.decode(MatchScedule.self, from: data)
    
    let info = "\(match.title) "
 
    
}
// in case we need date format
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy/MM/dd HH:mm"
//    let someDateTime = formatter.date(from: "2016/10/08 22:31")
// OR
//    extension Date {
//        var timeZoneEST: String {
//            let formatter = DateFormatter();
//            formatter.dateFormat = "MMMM dd, yyyy HH:mm"
//            formatter.timeZone = TimeZone(abbreviation: "EST")
//            return formatter.string(from: self)
//        }


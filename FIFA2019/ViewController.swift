//
//  ViewController.swift
//  FIFA2019
//
//  Created by Mitali Ahir on 2019-07-02.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let matches = [
        MatchSchedule(type: "Semi Final",
                                   date: "July 07, 2019",
                                   time: "11:00",
                                   teamA: Team(name: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
                                   teamB: Team(name: "USA", flag: "🇺🇸"),
                                   location: Location(stadium: "Stade Océane",
                                                      city: "Le Harve",
                                                      longitude: 0.168880,
                                                      latitude: 49.497270
            )
        ),
        MatchSchedule(type: "Semi Final",
                      date: "July 07, 2019",
                      time: "11:00",
                      teamA: Team(name: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
                      teamB: Team(name: "USA", flag: "🇺🇸"),
                      location: Location(stadium: "Stade Océane",
                                         city: "Le Harve",
                                         longitude: 0.168880,
                                         latitude: 49.497270
            )
        ),
        MatchSchedule(type: "Final",
                               date: "August 08, 2019",
                               time: "11:00",
                               teamA: Team(name: "Sweden", flag: "🇸🇪"),
                               teamB: Team(name: "USA", flag: "🇺🇸"),
                               location:  Location(stadium: "Stade de Lyon",
                                                   city: "Lyon",
                                                   longitude: 5.482580,
                                                   latitude: 45.555660
            )
        ),
        MatchSchedule(type: "MatchFor3rdPlace",
                                          date: "July 06, 2019",
                                          time: "17:00",
                                          teamA: Team(name: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
                                          teamB: Team(name: "Netherland", flag: "🇳🇱"),
                                          location: Location(stadium: "Stade de Nice",
                                                             city: "Nice",
                                                             longitude: -0.428060,
                                                             latitude: 44.915958
            )
        ),
        MatchSchedule(type: "QF",
                            date: "June 27, 2019",
                            time: "21:00",
                            teamA: Team(name: "Norway", flag: "🇳🇴"),
                            teamB: Team(name: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
                            location: Location(stadium: "Stade Océane",
                                               city: "Le Havre",
                                               longitude: 0.168880,
                                               latitude: 49.497270
            )
        )
    ]
    
    
    var sortedMatches: [MatchSchedule] = []
    var matchDates: [Date] = []
    
    @IBOutlet weak var matchsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        
        sortedMatches = matches.sorted(by: { dateFormatter.date(from: $0.date)?.compare(dateFormatter.date(from: $1.date)!) == .orderedAscending })
        
        matchDates = sortedMatches.map{dateFormatter.date(from: $0.date)!};
        matchDates = Array(Set(matchDates))
        matchDates = matchDates.sorted()
        
        matchsTableView.dataSource = self
        matchsTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        
        let matchDate = matchDates[section]
        let matchCount = sortedMatches.filter(){
            dateFormatter.date(from: $0.date)  == matchDate
        }.count
        return matchCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell()}
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        
        let matchDate = matchDates[indexPath.section]
        let matchesOnDate = sortedMatches.filter(){
            dateFormatter.date(from: $0.date)  == matchDate
            }
        let match = matchesOnDate[indexPath.row]
    
        cell.detailTextLabel?.text = match.type
        cell.textLabel?.text = "\(match.teamA.flag)" + " \(match.teamA.name)" + " \(match.date)" + " \(match.teamB.name)" + " \(match.teamB.flag)"
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: matchDates[section])
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return matchDates.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "moveToDefinitionSegue", sender: nil)

    }
}


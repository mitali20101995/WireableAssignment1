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
        "semifinal": MatchSchedule(type: "Semi Final",
                                   date: "July 7,2019",
                                   time: "11:00",
                                   teamA: Team(name: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
                                   teamB: Team(name: "USA", flag: "🇺🇸"),
                                   location: Location(stadium: "Stade Océane",
                                                      city: "Le Harve",
                                                      longitude: 0.168880,
                                                      latitude: 49.497270
            )
        ),
        "final": MatchSchedule(type: "Final",
                               date: "July 8,2019",
                               time: "11:00",
                               teamA: Team(name: "Sweden", flag: "🇸🇪"),
                               teamB: Team(name: "USA", flag: "🇺🇸"),
                               location:  Location(stadium: "Stade de Lyon",
                                                   city: "Lyon",
                                                   longitude: 5.482580,
                                                   latitude: 45.555660
            )
        ),
        "MatchFor3rdPlace": MatchSchedule(type: "MatchFor3rdPlace",
                                          date: "06 Jul 2019",
                                          time: "17:00",
                                          teamA: Team(name: "England", flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
                                          teamB: Team(name: "Netherland", flag: "🇳🇱"),
                                          location: Location(stadium: "Stade de Nice",
                                                             city: "Nice",
                                                             longitude: -0.428060,
                                                             latitude: 44.915958
            )
        ),
        "QF": MatchSchedule(type: "QF",
                            date: "27 Jun 2019",
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
    
    
    @IBOutlet weak var matchsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matchsTableView.dataSource = self
        matchsTableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = UITableViewCell()
       let matchKey =  Array(matches.keys)[indexPath.row]
        let match = matches[matchKey]
        cell.textLabel?.text = match?.type
        return cell
//        let cell = CustomCell()
//        cell.flagA = match?.teamA.flag
//        cell.flagB = match?.teamB.flag
//        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "moveToDefinitionSegue", sender: nil)
        
    }
}


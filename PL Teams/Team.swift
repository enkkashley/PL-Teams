//
//  Team.swift
//  PL Teams
//
//  Created by Emmanuel Ashley on 03/11/2020.
//  Copyright © 2020 Emmanuel Ashley. All rights reserved.
//

import SwiftUI

struct Team: Equatable, Codable, Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let yearEstablished: String
    let stadium: String
    
    static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Team {
    static let arsenal = Team(image: "arsenal", name: "Arsenal", yearEstablished: "1886", stadium: "Emirates Stadium")
    
    static func premierLeagueTeams() -> [Team] {
        [
             Team(image: "arsenal", name: "Arsenal", yearEstablished: "1886", stadium: "Emirates Stadium"),
             Team(image: "astonVilla", name: "Aston Villa", yearEstablished: "1874", stadium: "Villa Park"),
             Team(image: "brighton", name: "Brighton & Hove Albion", yearEstablished: "1901", stadium: "Amex"),
             Team(image: "burnley", name: "Burnley", yearEstablished: "1882", stadium: "Turf Moor"),
             Team(image: "chelsea", name: "Chelsea", yearEstablished: "1905", stadium: "Stamford Bridge"),
             Team(image: "crystalPalace", name: "Crystal Palace", yearEstablished: "1905", stadium: "Selhurst Park"),
             Team(image: "everton", name: "Everton", yearEstablished: "1878", stadium: "Goodison Park"),
             Team(image: "fulham", name: "Fulham", yearEstablished: "1879", stadium: "Craven Cottage"),
             Team(image: "leeds", name: "Leeds United", yearEstablished: "1919", stadium: "Elland Road"),
             Team(image: "leicester", name: "Leicester", yearEstablished: "1884", stadium: "King Power Stadium"),
             Team(image: "liverpool", name: "Liverpool", yearEstablished: "1892", stadium: "Anfield"),
             Team(image: "manchesterCity", name: "Manchester City", yearEstablished: "1880", stadium: "Etihad Stadium"),
             Team(image: "manchesterUnited", name: "Manchester United", yearEstablished: "1878", stadium: "Old Trafford"),
             Team(image: "newcastleUnited", name: "Newcastle United", yearEstablished: "1892", stadium: "St. James' Park"),
             Team(image: "sheffieldUnited", name: "Sheffield United", yearEstablished: "1889", stadium: "Bramall Lane"),
             Team(image: "southampton", name: "Southampton", yearEstablished: "1885", stadium: "St. Mary's Stadium"),
             Team(image: "tottenhamHotspur", name: "Tottenham Hotspur", yearEstablished: "1882", stadium: "Tottenham Hotspur Stadium"),
             Team(image: "westBrom", name: "West Bromwich Albion", yearEstablished: "1878", stadium: "The Hawthorns"),
             Team(image: "westHam", name: "West Ham", yearEstablished: "1895", stadium: "London Stadium"),
             Team(image: "wolves", name: "Wolverhampton Wanderers", yearEstablished: "1877", stadium: "Molineux Stadium")
        ]
    }
}

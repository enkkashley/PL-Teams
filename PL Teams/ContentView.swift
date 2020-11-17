//
//  ContentView.swift
//  PL Teams
//
//  Created by Emmanuel Ashley on 26/08/2020.
//  Copyright © 2020 Emmanuel Ashley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let premierLeagueTeams = Team.premierLeagueTeams()
    
    var body: some View {
        NavigationView {
            List(premierLeagueTeams) { team in
                NavigationLink(destination: TeamDetailView(team: team)) {
                   TeamRow(team: team)
                }
            }
            .navigationBarTitle(Text("PL Teams"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//
//  TeamDetailView.swift
//  PL Teams
//
//  Created by Emmanuel Ashley on 03/11/2020.
//  Copyright © 2020 Emmanuel Ashley. All rights reserved.
//

import SwiftUI
import WidgetKit

struct TeamDetailView: View {
    
    @AppStorage("team", store: UserDefaults(suiteName: "group.com.enkkashley.PL-Teams")) var teamData = Data()
    
    @State var isFavorite = false
    
    let team: Team
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                
                Button(action: {
                    heartIconTapped()
                }) {
                    if isFavorite {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "heart")
                            .foregroundColor(.gray)
                            .font(.largeTitle)
                    }
                }
            }
            .padding()
            
            VStack(spacing: 70) {
                Image(team.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 180)
                    .padding(.vertical, 50)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
                
                VStack {
                    DetailRow(name: "Year Established", value: team.yearEstablished)
                    DetailRow(name: "Stadium", value: team.stadium)
                }
                .padding()
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .navigationBarTitle(team.name, displayMode: .inline)
        .onAppear {
            retrieveSavedTeam()
        }
    }
    
    func heartIconTapped() {
        isFavorite.toggle()
        
        if isFavorite {
            save(team)
        } else {
            deleteTeam()
        }
    }
   
    func save(_ team: Team) {
        guard let teamData = try? JSONEncoder().encode(team) else { return }
        self.teamData = teamData
        // Ask WidgetKit to reload its timeline / Make a request to WidgetKit for a new timeline
        WidgetCenter.shared.reloadTimelines(ofKind: "TeamWidget")
    }
    
    func deleteTeam() {
        UserDefaults(suiteName: "group.com.enkkashley.PL-Teams")?.removeObject(forKey: "team")
        WidgetCenter.shared.reloadTimelines(ofKind: "TeamWidget")
    }
    
    func retrieveSavedTeam() {
        guard let teamData = try? JSONDecoder().decode(Team.self, from: teamData) else { return }
        
        if teamData == team {
            isFavorite = true
        } else {
            isFavorite = false
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(team: Team.arsenal)
    }
}

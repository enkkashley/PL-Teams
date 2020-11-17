//
//  TeamWidget.swift
//  TeamWidget
//
//  Created by Emmanuel Ashley on 03/11/2020.
//  Copyright © 2020 Emmanuel Ashley. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    @AppStorage("team", store: UserDefaults(suiteName: "group.com.enkkashley.PL-Teams")) var teamData = Data()

    func placeholder(in context: Context) -> TeamEntry {
        TeamEntry(date: Date(), team: Team.arsenal)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TeamEntry) -> ()) {
        let entry = TeamEntry(date: Date(), team: Team.arsenal)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TeamEntry>) -> ()) {
 
        // if UserDefaults has favorite team, then create an entry and a timeline with that team
        if let teamData = try? JSONDecoder().decode(Team.self, from: teamData) {
            let entry = TeamEntry(date: Date(), team: teamData)

            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        } else {
            // else set team to nil
            let entry = TeamEntry(date: Date(), team: nil)

            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct TeamEntry: TimelineEntry {
    let date: Date
    let team: Team?
}

struct TeamEntryView: View {
    let entry: Provider.Entry
    
    var body: some View {
        if entry.team == nil {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8980392157, green: 0.1333333333, blue: 0.4705882353, alpha: 1)), Color(#colorLiteral(red: 0.2156862745, green: 0, blue: 0.2352941176, alpha: 1))]), startPoint: .topLeading, endPoint: .trailing)
                
                VStack {
                    Spacer()
                    
                    Text("Tap to open the app and select your favorite team")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding()
            }
        } else {
            Image(entry.team!.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.white)
                .frame(width: 100, height: 100)
                
        }
    }
}

@main
struct TeamWidget: Widget {
    let kind = "TeamWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TeamEntryView(entry: entry)
        }
        .configurationDisplayName("Favorite Team")
        .description("See your favorite team's logo")
        .supportedFamilies([.systemSmall])
    }
}

struct TeamWidget_Previews: PreviewProvider {
    static var previews: some View {
        TeamEntryView(entry: TeamEntry(date: Date(), team: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

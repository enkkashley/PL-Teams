//
//  TeamRow.swift
//  PL Teams
//
//  Created by Emmanuel Ashley on 03/11/2020.
//  Copyright © 2020 Emmanuel Ashley. All rights reserved.
//

import SwiftUI

struct TeamRow: View {
    let team: Team
    
    var body: some View {
        HStack {
            Image(team.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text(team.name)
                .font(.system(size: 17, weight: .semibold, design: .rounded))
                
        }
    }
}

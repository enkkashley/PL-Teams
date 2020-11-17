//
//  DetailRow.swift
//  PL Teams
//
//  Created by Emmanuel Ashley on 03/11/2020.
//  Copyright © 2020 Emmanuel Ashley. All rights reserved.
//

import SwiftUI

struct DetailRow: View {
    let name: String
    let value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                Spacer()
                
                Text(value)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
            }
            
            Divider()
        }
    }
}


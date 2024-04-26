//
//  SwiftUIView.swift
//  
//
//  Created by 신승재 on 3/25/24.
//

import SwiftUI

struct DotsTitleKeywords: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 8, height: 8)
                .padding(.leading, 10)
                .padding(.trailing, 15)
                .foregroundColor(ColorPalette.primaryColor)
            HStack() {
                Text(title)
                    .font(.headline)
                Text("[\(subTitle)]")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.padding(.trailing, 10)
        }
    }
}

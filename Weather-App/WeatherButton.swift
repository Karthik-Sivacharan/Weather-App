//
//  WeatherButton.swift
//  Weather-App
//
//  Created by Karthik Sivacharan on 9/12/24.
//

import SwiftUI
struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text (title)
            .frame(width: 320, height:64)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .cornerRadius(20)
    }
}

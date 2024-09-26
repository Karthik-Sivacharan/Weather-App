//
//  ContentView.swift
//  Weather-App
//
//  Created by Karthik Sivacharan on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)

            VStack {
                CityTextView(cityName: "Manhattan, NY")
            
                Spacer()
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                
                Spacer()
                
                HStack (spacing: 24) {
                    WeatherDateView(dayofWeek: "Tue", imageName: "cloud.sun.fill", temperature: 74)
                    
                    WeatherDateView(dayofWeek: "Wed", imageName: "sun.max.fill", temperature: 85)
                    
                    WeatherDateView(dayofWeek: "Thu", imageName: "wind.snow", temperature: 43)
                    
                    WeatherDateView(dayofWeek: "Fri", imageName: "cloud.sun.fill", temperature: 72)
                    
                    WeatherDateView(dayofWeek: "Sat", imageName: "snowflake", temperature: 25)
                }
                
                Spacer()
                
                
                Toggle(isOn: $isNight) {
                    HStack {
                        Image(systemName: isNight ? "moon.fill" : "sun.max.fill")
                            .foregroundColor(isNight ? .yellow : .white)
                        Text(isNight ? "Dark Mode" : "Light Mode")
                            .foregroundColor(isNight ? .white : .white)
                            .font(.custom("Avenir-Heavy", size: 18))
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: isNight ? .yellow : .blue))
                .padding(.vertical, 32)
                .padding(.horizontal, 52)

                }
            }
        }
    }

#Preview {
    ContentView()
}

struct WeatherDateView: View {
    
    var dayofWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayofWeek)
                .font(.custom("Avenir-Heavy", size: 16))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 36, height: 36)
            Text("\(temperature)°")
                .font(.custom("Avenir-Heavy", size: 24))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("lightBlue"), isNight ? .gray : Color("darkBlue") ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}



struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.custom("Avenir-Heavy", size: 24))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 4) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            
            Text("\(temperature)°")
                .font(.custom("Avenir-Medium", size: 72))
                .foregroundColor(.white)
                .shadow(color: Color.white.opacity(0.6), radius: 2, x: 0, y: 0) // Glow effect
                .blur(radius: 0.1) // Slight blur to enhance the glow effect
        }
    }
}


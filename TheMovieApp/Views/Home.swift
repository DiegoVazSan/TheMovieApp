//
//  Home.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 26/04/24.
//

import SwiftUI

struct Home: View {
    
    var background : some View {
       let background = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
        return background
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    
                    Text("Hola")
                }
            }
        }
    }
}

//#Preview {
//    Home()
//}

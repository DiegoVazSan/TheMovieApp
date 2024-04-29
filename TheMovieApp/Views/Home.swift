//
//  Home.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 26/04/24.
//

import SwiftUI

struct Home: View {
    
    @State var search : String
    @State var buscar = false
    
    var background : some View {
       let background = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
        return background
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    TextField("Search", text: $search)
                        .textFieldStyle(.roundedBorder)
                        .padding(.top, 15)
                        .padding(.bottom, 20)
                        .onAppear{
                            search = ""
                        }
                    Button(action: {
                        buscar.toggle()
                    }, label: {
                        Text("Search")
                            .font(.title2)
                            .bold()
                    })
                    .buttonStyle(.bordered)
                    .tint(.white)
                    Spacer()
                    .navigationDestination(isPresented: $buscar) {
                        MoviesView(movie: search)
                    }
                }
                .padding()
                .navigationTitle("App Movie Search")
            }
        }
    }
}

//#Preview {
//    Home()
//}

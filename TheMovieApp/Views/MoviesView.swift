//
//  MoviesView.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 29/04/24.
//

import SwiftUI

struct MoviesView: View {
    
    var movie : String
    @StateObject var moviesVM = MoviesViewModel()
    
    var body: some View {
        VStack {
            Text(movie)
        }.task {
            await moviesVM.fetch(movie: movie)
        }
    }
    
}

//#Preview {
//    MoviesView()
//}

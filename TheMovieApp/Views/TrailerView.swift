//
//  TrailerView.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 30/04/24.
//

import SwiftUI

struct TrailerView: View {
    
    @StateObject var moviesVM: MoviesViewModel
    
    var body: some View {
        VStack {
            Text(moviesVM.title)
        }.task {
            await moviesVM.fetchVideo()
        }
    }
    
}

//#Preview {
//    TrailerView()
//}

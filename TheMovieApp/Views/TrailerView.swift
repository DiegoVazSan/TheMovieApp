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
        Text(moviesVM.title)
    }
    
}

//#Preview {
//    TrailerView()
//}

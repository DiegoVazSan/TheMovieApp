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
            
            List {
                ForEach(moviesVM.dataMovies) { item in
                    CardView(poster: item.poster_path ?? "", title: item.original_title,
                             overView: item.overview) {
                        print("Hello World !!")
                    }
                }
            }
            
        }.task {
            await moviesVM.fetch(movie: movie)
        }
    }
    
}

struct CardView : View {
    
    var poster : String
    var title : String
    var overView : String
    var action : () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(poster)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 5)
            }placeholder: {
                Image("cinema")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 500)
            }
            Text(title).font(.title)
            Text(overView).foregroundColor(.gray)
        }
        .padding(.all)
        .onTapGesture {
            action()
        }
    }
}

//#Preview {
//    MoviesView()
//}

//
//  MoviesViewModel.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 29/04/24.
//

import Foundation

@MainActor
class MoviesViewModel : ObservableObject {
    
    @Published var dataMovies: [MovieItem] = []
    @Published var title = ""
    @Published var movieID = 0
    @Published var show = false 
    @Published var key = ""
    
    func fetch(movie: String) async {
        do {
            
            let urlString = "https://api.themoviedb.org/3/search/movie?api_key=d14c6d24b01c1b51f751a8ebd534046d&language=en-US&query=\(movie)&page=1&include_adult=false"
            
            guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedJSON = try JSONDecoder().decode(Movies.self, from: data)
            
            print(decodedJSON.results)
            self.dataMovies = decodedJSON.results
            
        } catch let failure as NSError {
            print("THE MOVIE DB API ERROR, ", failure.localizedDescription)
        }
    }
    
    func fetchVideo() async {
        do {
            
            let urlString = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=d14c6d24b01c1b51f751a8ebd534046d&language=en-US"
            
            guard let url = URL(string: urlString) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedJSON = try JSONDecoder().decode(VideoModel.self, from: data)
            let result = decodedJSON.results.filter({ $0.type.contains("Trailer") })
            self.key = result.first?.key ?? ""
            
            print("KEY 🔑 :\(self.key)")
            
        } catch let failure as NSError {
            print("THE MOVIE DB API ERROR, ", failure.localizedDescription)
        }
    }
    
    
    func sendItem(item: MovieItem) {
        title = item.original_title
        movieID = item.id
        show.toggle()
    }
    
    
}

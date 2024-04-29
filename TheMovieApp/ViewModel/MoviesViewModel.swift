//
//  MoviesViewModel.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 29/04/24.
//

import Foundation

@MainActor
class MoviesViewModel : ObservableObject {
    
    @Published var dataMovies: [Result] = []
    
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
    
}

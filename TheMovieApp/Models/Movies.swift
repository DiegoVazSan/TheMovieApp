//
//  Movies.swift
//  TheMovieApp
//
//  Created by Diego Vazquez Sanchez on 29/04/24.
//

import Foundation

struct Movies: Codable {
    
    let page: Int
    let results: [Result]
    
}

// MARK: - Result
struct Result: Codable, Identifiable {
    
    let id: Int
    let poster_path: String?
    let original_title: String
    let overview: String
    
}

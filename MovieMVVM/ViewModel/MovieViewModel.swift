//
//  MovieViewModel.swift
//  MovieMVVM
//
//  Created by Hmoo Myat Theingi on 23/01/2024.
//

import Foundation

class MovieViewModel {
    var movies: [Movie] = []
    
    func fetchMovies(completion: @escaping () -> Void) {
        
        MovieService.shared.fetchPopularMovies { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.results.map {
                    Movie(title: $0.title, posterPath: $0.posterPath, overview: $0.overview, releasedDate: $0.releasedDate)
                }
                DispatchQueue.main.async {
                    completion()
                }
                
            case .failure(let error):
                print("Error fetching movies: \(error.localizedDescription)")
            }
        }
    }
}

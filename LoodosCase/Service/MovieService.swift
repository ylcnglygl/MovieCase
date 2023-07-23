//
//  MovieService.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 19.07.2023.
//

var apiKey: String = ""

import Alamofire

private let omdbUrl = Constants.MovieService.movieServiceUrl

protocol IMovieService {
    func fetchMovies(movieTitle: String?, response: @escaping (Movies?) -> Void)
    func fetchMovieDetail(id: String?, response: @escaping (MovieDetail?) -> Void)
}

struct MovieService: IMovieService {
   
    func fetchMovies(movieTitle: String?, response: @escaping (Movies?) -> Void) {
        guard let title = movieTitle else { return }
        AF.request("\(omdbUrl)?s=\(title)&apikey=\(apiKey)").responseDecodable(of: Movies.self) { (movieResponse) in
            guard let movies = movieResponse.value else {
                response(nil)
                return
            }
            response(movies)
        }
    }
    
    func fetchMovieDetail(id: String?, response: @escaping (MovieDetail?) -> Void) {
        guard let id = id else { return }
        AF.request("\(omdbUrl)?i=\(id)&apikey=\(apiKey)").responseDecodable(of: MovieDetail.self) { (movieDetailResponse) in
            guard let movieDetail = movieDetailResponse.value else {
                response(nil)
                return
            }
            response(movieDetail)
        }
    }
    
}

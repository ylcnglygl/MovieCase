//
//  MockMovieService.swift
//  LoodosCaseTests
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import XCTest
@testable import LoodosCase

class MockMovieService: IMovieService {
    
    static var shouldSuccess = false
    
    static var movies: Movies {
        return Movies(
            search: [
                Search(
                    title: "batman",
                    year: "1999",
                    imdbID: "imdb",
                    type: .movie,
                    poster: "poster"
                )
            ],
            totalResults: "total results",
            response: "response"
        )
    }
    
    static var movieDetail: MovieDetail {
        return MovieDetail(title: "Batman Begins", year: "2005", rated: "PG-13", released: "15 Jun 2005", runtime: "140 min", genre: "Action, Crime, Drama", director: "Christopher Nolan", writer: "Bob Kane, David S. Goyer, Christopher Nolan", actors: "Christian Bale, Michael Caine, Ken Watanabe", plot: "After witnessing his parents' death, Bruce learns the art of fighting to confront injustice. When he returns to Gotham as Batman, he must stop a secret society that intends to destroy the city.", language: "English, Mandarin", country: "United States, United Kingdom", awards: "Nominated for 1 Oscar. 14 wins & 79 nominations total", poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", ratings: [Rating(source: "Internet Movie Database", value: "8.2/10")], metascore: "70", imdbRating: "8.2", imdbVotes: "1,507,891", imdbID: "tt0372784", type: "movie", dvd: "18 Oct 2005", boxOffice: "$206,863,479", production: "N/A", website: "N/A", response: "True")
    }
    
    func fetchMovies(movieTitle: String?, response: @escaping (LoodosCase.Movies?) -> Void) {
        if MockMovieService.shouldSuccess {
            response(MockMovieService.movies)
        } else {
            response(nil)
        }
    }
    
    func fetchMovieDetail(id: String?, response: @escaping (LoodosCase.MovieDetail?) -> Void) {
        if MockMovieService.shouldSuccess {
            response(MockMovieService.movieDetail)
        } else {
            response(nil)
        }
    }
    
    
}


//
//  HomePageViewModel.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 18.07.2023.
//

import Foundation

protocol IHomePageViewModel {
    var movieService: IMovieService { get set }
    func fetchMovies(movieTitle: String?)
    func setDelegate(output: MovieOutput)
}

class HomePageViewModel: IHomePageViewModel {
    var movieService: IMovieService
    var movieOutput: MovieOutput?
    init() {
        movieService = MovieService()
    }
    
    func fetchMovies(movieTitle: String?) {
        guard let movieTitle = movieTitle, !movieTitle.isEmpty else { return }
        movieOutput?.showIndicator()
            self.movieService.fetchMovies(movieTitle: movieTitle) { [weak self] movie in
                self?.movieOutput?.dismissIndicator()
                guard let movie = movie else { return }
                self?.movieOutput?.saveDatas(response: movie)
            }
    }
    
    func setDelegate(output: MovieOutput) {
        movieOutput = output
    }
}

//
//  MovieDetailViewModel.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 18.07.2023.
//

import Foundation

protocol IMovieDetailViewModel {
    var movieService: IMovieService { get set }
    func fetchMovieDetail(movieId: String?)
    func setDelegate(output: MovieDetailOutput)
}

class MovieDetailViewModel: IMovieDetailViewModel {
    var movieService: IMovieService
    var movieDetailOutput: MovieDetailOutput?
    init() {
        movieService = MovieService()
    }
    
    func fetchMovieDetail(movieId: String?) {
        guard let movieId = movieId else { return }
        movieDetailOutput?.showIndicator()
        movieService.fetchMovieDetail(id: movieId) { [weak self] movieDetail in
            self?.movieDetailOutput?.dismissIndicator()
            guard let movieDetail = movieDetail else {
                self?.movieDetailOutput?.showAlertError(title: Constants.SplashViewController.alertTitle, message: Constants.MovieDetailViewController.movieDetailAlertMessage, actionTitle: Constants.SplashViewController.alertActionTitle)
                return
            }
            self?.movieDetailOutput?.saveDatas(response: movieDetail)
        }
    }
    
    func setDelegate(output: MovieDetailOutput) {
        movieDetailOutput = output
    }
    
}

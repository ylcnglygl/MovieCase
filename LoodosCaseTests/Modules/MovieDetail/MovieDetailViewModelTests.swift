//
//  MovieDetailViewModelTests.swift
//  LoodosCaseTests
//
//  Created by Yalçın Golayoğlu on 23.07.2023.
//

import XCTest
@testable import LoodosCase

final class MovieDetailViewModelTests: XCTestCase {
    
    var stud: IMovieDetailViewModel = MovieDetailViewModel()
    let viewController = MockMovieDetailViewController()
    let service = MockMovieService()
    
    
    override func setUp() {
        super.setUp()
        stud.movieService = service
        stud.setDelegate(output: viewController)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchMovieDetail() {
        MockMovieService.shouldSuccess = true
        stud.fetchMovieDetail(movieId: MockMovieService.movies.search.first?.imdbID)
        XCTAssertTrue(viewController.isShowIndicator)
        XCTAssertTrue(viewController.isDismissIndicator)
        XCTAssertTrue(viewController.isSaveDatas)
    }
    
    func testFetchMovieDetailError() {
        MockMovieService.shouldSuccess = false
        stud.fetchMovieDetail(movieId: "1")
        XCTAssertTrue(viewController.isShowAlertError)
    }

}

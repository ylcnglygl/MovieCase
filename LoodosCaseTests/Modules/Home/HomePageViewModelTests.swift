//
//  HomePageViewModelTests.swift
//  LoodosCaseTests
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import XCTest
@testable import LoodosCase

final class HomePageViewModelTests: XCTestCase {
  
    var stud: IHomePageViewModel = HomePageViewModel()
    let viewController = MockHomePageViewController()
    let service = MockMovieService()
    
    override func setUp() {
        super.setUp()
        stud.movieService = service
        stud.setDelegate(output: viewController)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchMovies() {
        MockMovieService.shouldSuccess = true
        stud.fetchMovies(movieTitle: "batman")
        XCTAssertTrue(viewController.isShowIndicator)
        XCTAssertTrue(viewController.isDismissIndicator)
        XCTAssertTrue(viewController.isSaveDatas)
    }
}

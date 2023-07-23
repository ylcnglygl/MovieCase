//
//  MockMovieDetailViewController.swift
//  LoodosCaseTests
//
//  Created by Yalçın Golayoğlu on 23.07.2023.
//

import Foundation

import XCTest
@testable import LoodosCase

final class MockMovieDetailViewController: MovieDetailOutput {
    
    var viewModel: IMovieDetailViewModel?

    var isSaveDatas = false
    var isShowIndicator = false
    var isDismissIndicator = false
    var isShowAlertError = false
    
    func saveDatas(response: LoodosCase.MovieDetail) {
        isSaveDatas = true
    }
    
    func showIndicator() {
        isShowIndicator = true
    }
    
    func dismissIndicator() {
        isDismissIndicator = true
    }
    
    func showAlertError(title: String, message: String, actionTitle: String) {
        isShowAlertError = true
    }
    
    
}

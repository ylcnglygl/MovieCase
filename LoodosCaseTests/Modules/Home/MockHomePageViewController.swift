//
//  MockHomePageViewController.swift
//  LoodosCaseTests
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import XCTest
@testable import LoodosCase

final class MockHomePageViewController: MovieOutput {
    
    var viewModel: IHomePageViewModel?
    
    var isSaveDatas = false
    var isShowIndicator = false
    var isDismissIndicator = false
    
    func saveDatas(response: LoodosCase.Movies) {
        isSaveDatas = true
    }
    
    func showIndicator() {
        isShowIndicator = true
    }
    
    func dismissIndicator() {
        isDismissIndicator = true
    }
    
    
}

//
//  AnalyticsManager.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import Foundation
import FirebaseAnalytics

final class AnalyticsManager {
    private init() {}
    
    static let shared = AnalyticsManager()
    
    public func log(_ event: AnalyticsEvent) {
        var parameters: [String: Any] = [:]
        switch event {
        case .movieSelected(let movieSelectedEvent):
            do {
                let data = try JSONEncoder().encode(movieSelectedEvent)
                let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
                parameters = dict
            } catch {
                
            }
        }
        print("\n Event: \(event.eventName) | Params: \(parameters)")
        Analytics.logEvent(event.eventName, parameters: parameters)
    }
}

enum AnalyticsEvent {
    case movieSelected(MovieSelectedEvent)
    
    var eventName: String {
        switch self {
        case .movieSelected:
            return "movie_selected"
        }
    }
}

struct MovieSelectedEvent: Codable {
    let movieTitle: String?
    let movieYear: String?
    let movieRated: String?
    let movieReleased: String?
    let movieRunTime: String?
    let movieGenre: String?
    let movieDirector: String?
    let movieLanguage: String?
    let movieType: String?
}

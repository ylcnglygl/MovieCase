//
//  Constants.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import Foundation

internal enum Constants {
    internal enum Defaults {
        internal static let empty: String = "N/A"
    }
    internal enum SplashViewController {
        
        internal static let splashTime: Double = 3.0
        
        internal static let remoteConfigTitle: String = "movie_title"
        internal static let remoteConfigApiKey: String = "api_key"
        
        internal static let alertTitle: String = "Error"
        internal static let alertMessage: String = "No internet connection."
        internal static let alertActionTitle: String = "OK"
    }
    
    internal enum HomePageViewController {
        internal static let searchBarPlaceholder: String = "Search"
        internal static let collectionViewEmptyText: String = "Nothing to show"
        internal static let movieCollectionViewCellIdentifier: String = "MovieCollectionViewCell"
        internal static let defaultImage: String = "photo"
    }
    
    internal enum MovieDetailViewController {
        internal static let movieDetailAlertMessage: String = "This movie has no details."
        internal static let yearText: String = "Year"
        internal static let ratedText: String = "Rated"
        internal static let releasedText: String = "Released"
        internal static let runTimeText: String = "Run Time"
        internal static let genreText: String = "Genre"
        internal static let directorText: String = "Director"
        internal static let languageText: String = "Language"
        internal static let typeText: String = "Type"
        internal static let plotText: String = "Plot"
    }
    
    internal enum MovieService {
        internal static let movieServiceUrl: String = "http://www.omdbapi.com/"
    }
}

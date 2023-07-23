//
//  FeaturesView.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 20.07.2023.
//

import UIKit
import Cartography

class FeaturesView: UIView {
    
    var year: String? {
        get {
            return yearView.rightItem
        }
        set {
            if let year = newValue, newValue != Constants.Defaults.empty {
                yearView.rightItem = year
            } else {
                yearView.isHidden = true
            }
        }
    }
    
    var released: String? {
        get {
            return releasedView.rightItem
        }
        set {
            if let released = newValue, newValue != Constants.Defaults.empty {
                releasedView.rightItem = released
            } else {
                releasedView.isHidden = true
            }
        }
    }
    
    var runTime: String? {
        get {
            return runTimeView.rightItem
        }
        set {
            if let runTime = newValue, newValue != Constants.Defaults.empty {
                runTimeView.rightItem = runTime
            } else {
                runTimeView.isHidden = true
            }
        }
    }
    
    var genre: String? {
        get {
            return genreView.rightItem
        }
        set {
            if let genre = newValue, newValue != Constants.Defaults.empty {
                genreView.rightItem = genre
            } else {
                genreView.isHidden = true
            }
        }
    }
    
    var director: String? {
        get {
            return directorView.rightItem
        }
        set {
            if let director = newValue, newValue != Constants.Defaults.empty {
                directorView.rightItem = director
            } else {
                directorView.isHidden = true
            }
        }
    }
    
    var language: String? {
        get {
            return languageView.rightItem
        }
        set {
            if let language = newValue, newValue != Constants.Defaults.empty {
                languageView.rightItem = language
            } else {
                languageView.isHidden = true
            }
        }
    }
    
    var type: String? {
        get {
            return typeView.rightItem
        }
        set {
            if let type = newValue, newValue != Constants.Defaults.empty {
                typeView.rightItem = type
            } else {
                typeView.isHidden = true
            }
        }
    }
    
    private let yearView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.yearText
        return view
    }()
    
    private let releasedView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.releasedText
        return view
    }()
    
    private let runTimeView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.runTimeText
        return view
    }()
    
    private let genreView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.genreText
        return view
    }()
    
    private let directorView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.directorText
        return view
    }()
    
    private let languageView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.languageText
        return view
    }()
    
    private let typeView: MovieDetailHorizontalView = {
       let view = MovieDetailHorizontalView()
        view.leftItem = Constants.MovieDetailViewController.typeText
        return view
    }()
    
    private let featuresStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setViews() {
        featuresStackView.addArrangedSubview(yearView)
        featuresStackView.addArrangedSubview(releasedView)
        featuresStackView.addArrangedSubview(runTimeView)
        featuresStackView.addArrangedSubview(genreView)
        featuresStackView.addArrangedSubview(directorView)
        featuresStackView.addArrangedSubview(languageView)
        featuresStackView.addArrangedSubview(typeView)
        
        addSubview(featuresStackView)
        
        constrain(featuresStackView) {
            guard let superview = $0.superview else { return }
            $0.top == superview.top
            $0.left == superview.left
            $0.right == superview.right
            $0.bottom == superview.bottom
            
            $0.width == superview.width
        }
    }
    
    public func configure(movie: MovieDetail) {
        year = movie.year
        released = movie.released
        runTime = movie.runtime
        genre = movie.genre
        director = movie.director
        language = movie.language
        type = movie.type
    }
}

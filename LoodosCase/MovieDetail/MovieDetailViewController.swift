//
//  MovieDetailViewController.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 18.07.2023.
//

import UIKit
import Cartography
import JGProgressHUD

protocol MovieDetailOutput {
    func saveDatas(response: MovieDetail)
    func showIndicator()
    func dismissIndicator()
    func showAlertError(title: String, message: String, actionTitle: String)
}

class MovieDetailViewController: UIViewController {
    lazy var viewModel: IMovieDetailViewModel = MovieDetailViewModel()
    var movieId: String?
    private var movieDetail: MovieDetail?
    private let spinner = JGProgressHUD(style: .dark)
    
    var movieTitle: String? {
        get {
            return movieTitleLabel.text
        }
        set {
            if movieTitle == Constants.Defaults.empty {
                movieTitleLabel.isHidden = true
            } else {
                movieTitleLabel.text = newValue
            }
        }
    }
    
    var url: String? {
        get {
            return nil
        }
        set {
            if let url = newValue, newValue != Constants.Defaults.empty {
                movieDetailImageView.af.setImage(withURL: URL(string: url)!)
            } else {
                movieDetailImageView.isHidden = true
            }
        }
    }
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let movieDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let movieFeaturesView: FeaturesView = {
        let featuresView = FeaturesView()
        featuresView.sizeToFit()
        return featuresView
    }()
    
    private let moviePlotsView: PlotView = {
        let plotsView = PlotView()
        plotsView.sizeToFit()
        return plotsView
    }()
    
    private let movieDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.isHidden = true
        return stackView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel.setDelegate(output: self)
        viewModel.fetchMovieDetail(movieId: movieId)
        movieDetailStackView.addArrangedSubview(movieTitleLabel)
        movieDetailStackView.addArrangedSubview(movieDetailImageView)
        movieDetailStackView.addArrangedSubview(movieFeaturesView)
        movieDetailStackView.addArrangedSubview(moviePlotsView)
        
        movieDetailStackView.setCustomSpacing(Style.Defaults.spacingWide, after: movieTitleLabel)
        movieDetailStackView.setCustomSpacing(Style.Defaults.spacingWide, after: movieDetailImageView)
        movieDetailStackView.setCustomSpacing(Style.Defaults.spacingWide, after: movieFeaturesView)

        
        view.addSubview(movieDetailStackView)
        
        constrain(movieDetailStackView) {
            guard let superview = $0.superview else { return }
            $0.top == superview.safeAreaLayoutGuide.top + Style.Defaults.spacingWide
            $0.left == superview.left + Style.Defaults.margin
            $0.right == superview.right - Style.Defaults.margin
            $0.bottom == superview.bottom
            
            $0.width == superview.width - 2 * Style.Defaults.margin
        }
        
        constrain(movieDetailImageView) {
            guard let superview = $0.superview else { return }
            $0.width == superview.width
            $0.height == Style.MovieDetailViewController.movieDetailImageViewHeight
            $0.centerX == superview.centerX
        }
        
        
    }
    
}

extension MovieDetailViewController: MovieDetailOutput {
    func saveDatas(response: MovieDetail) {
        self.movieDetail = response
        url = response.poster
        movieTitle = response.title
        movieFeaturesView.configure(movie: response)
        moviePlotsView.configure(movie: response)
        
        movieDetailStackView.isHidden = false
        
        AnalyticsManager.shared.log(.movieSelected(.init(
            movieTitle: response.title,
            movieYear: response.year,
            movieRated: response.rated,
            movieReleased: response.released,
            movieRunTime: response.runtime,
            movieGenre: response.genre,
            movieDirector: response.director,
            movieLanguage: response.language,
            movieType: response.type )))
    }
    
    func showAlertError(title: String, message: String, actionTitle: String) {
        showAlert(title: title, message: message, actionTitle: actionTitle)
    }
    
    func showIndicator() {
        self.spinner.show(in: view)
    }
    
    func dismissIndicator() {
        self.spinner.dismiss()
    }
}

//
//  PlotView.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 20.07.2023.
//

import UIKit
import Cartography

class PlotView: UIView {
    
    var plot: String? {
        get {
            return moviePlotLabel.text
        }
        set {
            if let plot = newValue, newValue != Constants.Defaults.empty {
                moviePlotLabel.text = plot
            } else {
                moviePlotTitleLabel.isHidden = true
                moviePlotLabel.isHidden = true
            }
        }
    }
    
    private let moviePlotTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Constants.MovieDetailViewController.plotText
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let moviePlotLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let plotStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Style.Defaults.spacing
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
        plotStackView.addArrangedSubview(moviePlotTitleLabel)
        plotStackView.addArrangedSubview(moviePlotLabel)
        
        addSubview(plotStackView)
        
        constrain(plotStackView) {
            guard let superview = $0.superview else { return }
            $0.top == superview.top
            $0.left == superview.left
            $0.right == superview.right
            
            $0.width == superview.width
        }
    }
    
    public func configure(movie: MovieDetail) {
        plot = movie.plot
    }
}

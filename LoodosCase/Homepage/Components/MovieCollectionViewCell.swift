//
//  MovieCollectionViewCell.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 19.07.2023.
//

import UIKit
import Cartography
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = Constants.HomePageViewController.movieCollectionViewCellIdentifier
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var url: String? {
        get {
            return nil
        }
        set {
            if let url = newValue, newValue != Constants.Defaults.empty {
                productImageView.af.setImage(withURL: URL(string: url)!)
            } else {
                productImageView.image = UIImage(systemName: Constants.HomePageViewController.defaultImage)
            }
        }
    }
    
    // MARK: UI Components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .leading
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
        addSubview(productImageView)
        addSubview(titleLabel)
        
        constrain(productImageView, titleLabel) {
            guard let superview = $0.superview else { return }
            $0.top == superview.top + Style.Defaults.spacing
            $0.left == superview.left + Style.Defaults.spacing
            $0.right == superview.right - Style.Defaults.spacing
            $0.bottom == $1.top - Style.Defaults.spacingWide
            
            $1.bottom == superview.bottom - Style.Defaults.spacing
            
            $1.width == superview.width
            $0.centerX == $1.centerX
        }
    }
    
    public func configure(with model: Search) {
        url = model.poster
        title = model.title
    }
    
    override func prepareForReuse() {
        productImageView.image = nil
        title = nil
    }
  
}


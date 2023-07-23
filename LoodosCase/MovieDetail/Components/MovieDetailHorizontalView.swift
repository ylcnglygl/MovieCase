//
//  MovieDetailHorizontalView.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 20.07.2023.
//

import Foundation
import UIKit
import Cartography

class MovieDetailHorizontalView: UIView {
    var leftItem: String? {
        get {
            return leftItemLabel.text
        }
        set {
            leftItemLabel.text = newValue
        }
    }
    
    var rightItem: String? {
        get {
            return rightItemLabel.text
        }
        set {
            rightItemLabel.text = newValue
        }
    }
    
    private let leftItemLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let rightItemLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setViews() {
        addSubview(leftItemLabel)
        addSubview(rightItemLabel)
        
        constrain(leftItemLabel, rightItemLabel) {
            guard let superview = $0.superview else { return }
            $0.top == superview.top
            $0.bottom == superview.bottom
            $0.left == superview.left
            
            $1.top == superview.top
            $1.left == $0.right + Style.Defaults.spacing
            $1.right == superview.right
            $1.bottom == superview.bottom
        }
    }
    
    public func configure(leftItem: String, rightItem: String) {
        self.leftItem = leftItem
        self.rightItem = rightItem
    }
}

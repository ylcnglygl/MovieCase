//
//  Style.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import Foundation
import UIKit

internal enum Style {
    internal enum Defaults {
        internal static let spacing: CGFloat = 8.0.calculatedHeight
        internal static let spacingWide: CGFloat = 16.0.calculatedHeight
        internal static let spacingWider: CGFloat = 32.0.calculatedHeight
        
        internal static let margin: CGFloat = 16.0.calculatedWidth
        internal static let cornerRadius: CGFloat = 8.0.calculatedWidth
    }
    
    internal enum SplashViewController {
        internal static let splashTitleFont: UIFont = UIFont.systemFont(ofSize: CGFloat(48.0))
    }
    
    internal enum HomePageViewController {
        internal static let minimumLineSpacing: CGFloat = 8.0.calculatedHeight
        internal static let minimumInteritemSpacing: CGFloat = 4.0.calculatedHeight
        
        internal static let emptyTitleFont: UIFont = UIFont.systemFont(ofSize: CGFloat(16.0))

    }
    
    internal enum MovieDetailViewController {
        internal static let movieDetailImageViewHeight: CGFloat = 300.calculatedHeight
    }
}

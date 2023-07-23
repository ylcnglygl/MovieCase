//
//  Screen.swift
//  LoodosCase
//
//  Created by Yalçın Golayoğlu on 22.07.2023.
//

import UIKit

private struct Ratio {
    let width: CGFloat
    let height: CGFloat
}

enum Screen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let scale = UIScreen.main.scale
    
    private static let baseWidth: CGFloat = 390
    private static let baseHeight: CGFloat = 844
    
    fileprivate static let ratio: Ratio = {
        let widthRatio = min(width / baseWidth, 1.0)
        let heightRatio = min(height / baseHeight, 1.0)
        return Ratio(width: widthRatio, height: heightRatio)
    }()
}

extension Int {
    var calculatedWidth: CGFloat {
        return CGFloat(self).calculatedWidth
    }
    var calculatedHeight: CGFloat {
        return CGFloat(self).calculatedHeight
    }
}

extension Double {
    var calculatedWidth: CGFloat {
        return CGFloat(self).calculatedWidth
    }
    var calculatedHeight: CGFloat {
        return CGFloat(self).calculatedHeight
    }
}

extension CGFloat {
    var calculatedWidth: CGFloat {
        return (self * Screen.ratio.width).rounded()
    }
    var calculatedHeight: CGFloat {
        return (self * Screen.ratio.height).rounded()
    }
}





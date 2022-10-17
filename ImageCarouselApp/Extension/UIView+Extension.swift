//
//  UIView+Extension.swift
//  ImageCarouselApp
//

import Foundation
import UIKit

extension UIImageView {
    func setCornerRadius(radius: CGFloat = 6.0) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func makeRoundedView() {
        self.layer.cornerRadius = self.frame.height / 2.0
        self.clipsToBounds = true
    }
}

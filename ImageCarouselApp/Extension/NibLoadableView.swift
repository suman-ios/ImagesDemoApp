//
//  NibLoadableView.swift
//  ImageCarouselApp
//

import Foundation
import UIKit

public protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

public extension NibLoadableView {
    static var nibName: String {
        return "\(self)"
    }
}

public extension NibLoadableView where Self: UIView {
    static func loadFromNib() -> Self {
        return Bundle.main.loadNibNamed(Self.nibName, owner: nil, options: nil)?.first as! Self
    }
}

public extension NibLoadableView where Self: UIToolbar {
    static func loadFromNib() -> Self {
        return Bundle.main.loadNibNamed(Self.nibName, owner: nil, options: nil)?.first as! Self
    }
}

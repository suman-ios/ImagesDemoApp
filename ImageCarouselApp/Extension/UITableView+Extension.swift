//
//  UITableView+Extension.swift
//  ImageCarouselApp
//

import Foundation
import UIKit

public extension UITableView {
    
    func registerCell<T: UITableViewCell>(_: T.Type, in bundle: Bundle? = nil) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentity)
    }
    
    func registerView<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentity)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentity) as? T else {
            debugPrint("Could not dequeue cell with identifier: \(T.reuseIdentity)")
            return UITableViewCell() as! T
        }
        return cell
    }
    
    func dequeueReusableView<T: UITableViewHeaderFooterView>(_: T.Type) -> T where T: ReusableView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentity) as? T else {
            debugPrint("Could not dequeue cell with identifier: \(T.reuseIdentity)")
            return UIView() as! T
        }
        return view
    }
    
    func setUpAutoRowHeight(withEstimatedRowHeight estimatedRowHeight: CGFloat) {
        rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = estimatedRowHeight
    }
}

//
//  CarouselImageCollectionViewCell.swift
//  ImageCarouselApp
//

import UIKit

class CarouselImageCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var carouselImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        if let _ = carouselImageView {
            carouselImageView.setCornerRadius(radius: 10.0)
        }
    }
    
    func setupCell(imageName: String) {
        carouselImageView.image = UIImage(named: imageName)
        
    }
}

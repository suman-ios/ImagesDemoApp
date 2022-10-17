//
//  CarouselImageTableViewCell.swift
//  ImageCarouselApp
//

import UIKit

class CarouselImageTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    private var carouselImages = [CarouselImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        if let _ = imagesCollectionView {
            imagesCollectionView.registerCell(CarouselImageCollectionViewCell.self)
            imagesCollectionView.delegate = self
            imagesCollectionView.dataSource = self
        }
    }

    func setupCell(carouselImages: [CarouselImage]) {
        self.carouselImages = carouselImages
        self.pageControl.numberOfPages = carouselImages.count
        self.imagesCollectionView.reloadData()
    }
}

extension CarouselImageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CarouselImageCollectionViewCell.self, for: indexPath)
        cell.setupCell(imageName: carouselImages[indexPath.item].imageName ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 20, height: self.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = imagesCollectionView.contentOffset
        visibleRect.size = imagesCollectionView.bounds.size

        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = imagesCollectionView.indexPathForItem(at: visiblePoint) else {
            return
        }

        pageControl.currentPage = indexPath.item
    }
}

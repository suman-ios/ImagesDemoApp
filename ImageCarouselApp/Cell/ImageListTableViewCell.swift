//
//  ImageListTableViewCell.swift
//  ImageCarouselApp
//

import UIKit

class ImageListTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        if let _ = profileImageView {
            profileImageView.setCornerRadius()
        }
    }

    func setupCell(profile :ProfileName) {
        profileImageView.image = UIImage(named: "profileImage")
        imageNameLabel.text = profile.name ?? ""
    }
    
}

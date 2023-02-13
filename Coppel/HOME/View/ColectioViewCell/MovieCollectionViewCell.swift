//
//  MovieCollectionViewCell.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 09/02/23.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgPosterMovie: UIImageView!
    @IBOutlet weak var contentViewCell: UIView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblDescriptionMovie: UILabel!
    @IBOutlet weak var lblDateOfMovie: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewCell.layer.cornerRadius = 8
        lblTitleMovie.numberOfLines = 0
        lblDescriptionMovie.numberOfLines = 0
    }
    
    func setupCell(posterImage: String, titleOfMovie: String, descriptionMovie: String, dateOfMuvie: String, voteAverageMovie: String) {
        lblTitleMovie.text = titleOfMovie
        lblDescriptionMovie.text = descriptionMovie
        lblDateOfMovie.text = dateOfMuvie
        lblVoteAverage.text = voteAverageMovie
        imgPosterMovie.layer.cornerRadius = 8
        imgPosterMovie.kf.indicatorType = .activity
        imgPosterMovie.kf.setImage(with: URL(string:"\(dataForAPI.complementForURL)\(posterImage)"), placeholder: nil, options: [.transition(.fade(1.7))],completionHandler: nil)
    }
}

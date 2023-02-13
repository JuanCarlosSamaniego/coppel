//
//  CompaniesCollectionViewCell.swift
//  Coppel
//
//  Created by Juan carlos samaniego on 12/02/23.
//

import UIKit
import Kingfisher

class CompaniesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var imglogoCompanie:UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCountry: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(name: String, imgCompanie: String, country:String) {
        lblName.text = name
        lblCountry.text = country
        imglogoCompanie.layer.cornerRadius = 8
        contentView.layer.cornerRadius = 10
        imglogoCompanie.kf.indicatorType = .activity
        imglogoCompanie.kf.setImage(with: URL(string:"\(dataForAPI.complementForURL)\(imgCompanie)"), placeholder: nil, options: [.transition(.fade(1.7))],completionHandler: nil)
    }

}

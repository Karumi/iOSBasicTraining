//
//  SuperHeroTableViewCell.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class SuperHeroTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    func configureForHero(hero: SuperHero) {
        nameLabel.text = hero.name
        photoImageView.sd_setImageWithURL(hero.image)
        avengersBadgeImageView.hidden = !hero.isAvenger()
        applyImageGradient(photoImageView)
    }

    private func applyImageGradient(thumbnailImage: UIImageView) {
        guard thumbnailImage.layer.sublayers == nil else {
            return
        }
        let gradient: CAGradientLayer = CAGradientLayer(layer: thumbnailImage.layer)
        gradient.frame = thumbnailImage.bounds
        gradient.colors = [UIColor.gradientStartColor.CGColor, UIColor.gradientEndColor.CGColor]
        gradient.startPoint = CGPointMake(0.0, 0.6)
        gradient.endPoint = CGPointMake(0.0, 1.0)
        thumbnailImage.layer.insertSublayer(gradient, atIndex: 0)
    }
    
}
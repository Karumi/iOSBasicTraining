//
//  SuperHeroDetailViewController.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class SuperHeroDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avengersBadgeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let superHero = SuperHero(id: "3",
                                  name: "The Flash",
                                  description: "The fastest men alive",
                                  image: NSURL(string: "https://i0.wp.com/freakelitex.com/wp-content/uploads/2015/12/barry-allen-in-the-flash-season-2-tv-poster.jpg?resize=1024%2C640"),
                                  comics: [Comic]())
        showSuperHero(superHero)
    }

    @IBAction func didTapCaptureButton() {

    }

    private func showSuperHero(superHero: SuperHero) {
        title = superHero.name.uppercaseString
        nameLabel.text = superHero.name
        descriptionLabel.text = superHero.description
        avengersBadgeImageView.image = UIImage(named: "ic_avengers_badge")
        photoImageView.sd_setImageWithURL(superHero.image)
    }
}
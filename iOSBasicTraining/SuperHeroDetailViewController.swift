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
import Result

class SuperHeroDetailViewController: SuperHeroesDetectorViewController, SuperHeroDetailView {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avengersBadgeImageView: UIImageView!
    @IBOutlet weak var captureButton: UIButton!

    var presenter: SuperHeroDetailPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    @IBAction func didTapCaptureButton() {
        presenter.didTapCaptureButton()
    }

    func showSuperHero(superHero: SuperHero) {
        title = superHero.name.uppercaseString
        nameLabel.text = superHero.name
        descriptionLabel.text = superHero.formalDescription
        avengersBadgeImageView.hidden = !superHero.isAvenger()
        photoImageView.sd_setImageWithURL(superHero.image)
    }

    func hideCaptureButton() {
        captureButton.hidden = true
    }

}

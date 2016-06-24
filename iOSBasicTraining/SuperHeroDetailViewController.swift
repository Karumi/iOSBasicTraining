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

class SuperHeroDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avengersBadgeImageView: UIImageView!
    @IBOutlet weak var captureButton: UIButton!

    var superHero: SuperHero!
    private let superHeroesDetector = SuperHeroesDetector(
        apiClient: FakeSuperHeroesAPIClient(),
        capturedSuperHeroesStorage: CapturedSuperHeroesStorage())

    override func viewDidLoad() {
        super.viewDidLoad()
        showSuperHero()
    }

    @IBAction func didTapCaptureButton() {
        let id = superHero.id
        let result = superHeroesDetector.captureSuperHero(id)
        switch result {
        case .Success(_):
            captureButton.hidden = true
            view.makeToast("Evil super hero captured!")
            break
        default:
            view.makeToast("Ups, Something went wrong!")
        }
    }

    private func showSuperHero() {
        title = superHero.name.uppercaseString
        nameLabel.text = superHero.name
        descriptionLabel.text = superHero.description
        avengersBadgeImageView.hidden = !superHero.isAvenger()
        photoImageView.sd_setImageWithURL(superHero.image)
    }
}
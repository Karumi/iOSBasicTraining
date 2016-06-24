//
//  SuperHeroDetailPresenter.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class SuperHeroDetailPresenter: Presenter {

    private weak var view: SuperHeroDetailView?
    private let superHeroesDetector: SuperHeroesDetector
    private let superHero: SuperHero

    init(view: SuperHeroDetailView, superHeroesDetector: SuperHeroesDetector, superHero: SuperHero) {
        self.view = view
        self.superHeroesDetector = superHeroesDetector
        self.superHero = superHero
    }

    func viewDidLoad() {
        view?.showSuperHero(superHero)
    }

    func didTapCaptureButton() {
        let id = superHero.id
        let result = superHeroesDetector.captureSuperHero(id)
        switch result {
        case .Success(_):
            view?.hideCaptureButton()
            view?.showMessage("Evil super hero captured!")
            break
        default:
            view?.showMessage("Ups, Something went wrong!")
        }
    }

}

protocol SuperHeroDetailView: View {

    func showSuperHero(superHero: SuperHero)
    func hideCaptureButton()

}

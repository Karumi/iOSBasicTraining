//
//  SuperHeroDetailPresenter.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class SuperHeroDetailPresenter: Presenter {

    fileprivate weak var view: SuperHeroDetailView?
    fileprivate let captureSuperHero: CaptureSuperHero
    fileprivate let superHero: SuperHero

    init(view: SuperHeroDetailView, captureSuperHero: CaptureSuperHero, superHero: SuperHero) {
        self.view = view
        self.captureSuperHero = captureSuperHero
        self.superHero = superHero
    }

    func viewDidLoad() {
        view?.showSuperHero(superHero)
    }

    func didTapCaptureButton() {
        let id = superHero.id
        let result = captureSuperHero.capture(id)
        switch result {
        case .success(_):
            view?.hideCaptureButton()
            view?.showMessage("Evil super hero captured!")
            break
        default:
            view?.showMessage("Ups, Something went wrong!")
        }
    }

}

protocol SuperHeroDetailView: View {

    func showSuperHero(_ superHero: SuperHero)
    func hideCaptureButton()

}

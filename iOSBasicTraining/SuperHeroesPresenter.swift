//
//  SuperHeroesPresenter.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class SuperHeroesPresenter: Presenter {

    private weak var view: SuperHeroesView?
    private let getSuperHeroes: GetSuperHeroes

    init(view: SuperHeroesView, getSuperHeroes: GetSuperHeroes) {
        self.view = view
        self.getSuperHeroes = getSuperHeroes
    }

    func viewWillAppear() {
        loadSuperHeroes()
    }

    private func loadSuperHeroes() {
        view?.showLoading()
        getSuperHeroes.getAll { result in
            self.view?.hideLoading()
            switch result {
            case .Success(let superHeroes):
                self.showSuperHeroes(superHeroes)
                break
            case .Failure(let error):
                self.showError(error)
                break
            }
        }
    }

    private func showSuperHeroes(superHeroes: [SuperHero]) {
        view?.hideLoading()
        view?.superHeroes = superHeroes
        view?.showingEmptyCase = superHeroes.isEmpty
        view?.showingErrorCase = false
    }

    private func showError(error: SuperHeroesDetectorError) {
        guard let view = view else {
            return
        }
        view.hideLoading()
        view.showingEmptyCase = false
        switch error {
        case .ConnectionError:
            view.showingErrorCase = view.superHeroes.isEmpty
            if !view.superHeroes.isEmpty {
                view.showMessage("Ups, there is no connection!")
            }
            break
        default:
            if view.superHeroes.isEmpty {
                view.showingErrorCase = true
            } else {
                view.showMessage("Ups, unknown error detected!")
            }
            fatalError()
        }
    }

}

protocol SuperHeroesView: View {

    var showingEmptyCase: Bool { get set }
    var showingErrorCase: Bool { get set }
    var superHeroes: [SuperHero] { get set }

    func showLoading()
    func hideLoading()

}

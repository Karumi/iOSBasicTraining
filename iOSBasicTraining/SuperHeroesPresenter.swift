//
//  SuperHeroesPresenter.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class SuperHeroesPresenter: Presenter {

    fileprivate weak var view: SuperHeroesView?
    fileprivate let getSuperHeroes: GetSuperHeroes

    init(view: SuperHeroesView, getSuperHeroes: GetSuperHeroes) {
        self.view = view
        self.getSuperHeroes = getSuperHeroes
    }

    func viewWillAppear() {
        loadSuperHeroes()
    }

    fileprivate func loadSuperHeroes() {
        view?.showLoading()
        getSuperHeroes.getAll { result in
            self.view?.hideLoading()
            switch result {
            case .success(let superHeroes):
                self.showSuperHeroes(superHeroes)
                break
            case .failure(let error):
                self.showError(error)
                break
            }
        }
    }

    fileprivate func showSuperHeroes(_ superHeroes: [SuperHero]) {
        view?.superHeroes = superHeroes
        view?.showingEmptyCase = superHeroes.isEmpty
        view?.showingErrorCase = false
    }

    fileprivate func showError(_ error: SuperHeroesDetectorError) {
        guard let view = view else {
            return
        }

        view.showingEmptyCase = false
        switch error {
        case .connectionError:
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

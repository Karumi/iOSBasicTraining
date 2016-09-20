//
//  SuperHeroesDetectorServiceLocator.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit

class SuperHeroesDetectorServiceLocator {

    static func provideRootViewController() -> UIViewController {
        let viewController = storyBoard.instantiateInitialViewController() as! SuperHeroesViewController
        let getSuperHeroes = provideGetSuperHeroesUseCase()
        viewController.presenter = SuperHeroesPresenter(view: viewController,
                                                        getSuperHeroes: getSuperHeroes)
        return UINavigationController(rootViewController: viewController)
    }

    static func provideSuperHeroDetailViewController(_ superHero: SuperHero) -> UIViewController {
        let viewController = provideUIViewControllerWithName("SuperHeroDetailViewController") as! SuperHeroDetailViewController
        let captureSuperHero = provideCaptureSuperHeroUseCase()
        viewController.presenter = SuperHeroDetailPresenter(view: viewController,
                                                            captureSuperHero: captureSuperHero,
                                                            superHero: superHero)
        return viewController
    }

    fileprivate static func provideUIViewControllerWithName(_ name: String) -> UIViewController {
        return storyBoard.instantiateViewController(withIdentifier: name)
    }

    fileprivate static func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        let detector = provideSuperHeroesDetector()
        return GetSuperHeroes(superHeroesDetector: detector)
    }

    fileprivate static func provideCaptureSuperHeroUseCase() -> CaptureSuperHero {
        let detector = provideSuperHeroesDetector()
        return CaptureSuperHero(superHeroesDetector: detector)
    }

    fileprivate static func provideSuperHeroesDetector() -> SuperHeroesDetector {
        let repository = provideSuperHeroesRepository()
        return SuperHeroesDetector(superHeroesRepository: repository)
    }

    fileprivate static func provideSuperHeroesRepository() -> SuperHeroesRepository {
        let apiClient = provideSuperHeroesAPIClient()
        return SuperHeroesRepository(apiClient: apiClient,
                                   capturedSuperHeroesStorage: CapturedSuperHeroesStorage())
    }

    fileprivate static func provideSuperHeroesAPIClient() -> SuperHeroesAPIClient {
        return FakeSuperHeroesAPIClient()
    }

    fileprivate static var storyBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }()

}

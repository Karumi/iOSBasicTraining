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

    static func provideSuperHeroDetailViewController(superHero: SuperHero) -> UIViewController {
        let viewController = provideUIViewControllerWithName("SuperHeroDetailViewController") as! SuperHeroDetailViewController
        let captureSuperHero = provideCaptureSuperHeroUseCase()
        viewController.presenter = SuperHeroDetailPresenter(view: viewController,
                                                            captureSuperHero: captureSuperHero,
                                                            superHero: superHero)
        return viewController
    }

    private static func provideUIViewControllerWithName(name: String) -> UIViewController {
        return storyBoard.instantiateViewControllerWithIdentifier(name)
    }
    
    private static func provideGetSuperHeroesUseCase() -> GetSuperHeroes {
        let detector = provideSuperHeroesDetector()
        return GetSuperHeroes(superHeroesDetector: detector)
    }
    
    private static func provideCaptureSuperHeroUseCase() -> CaptureSuperHero {
        let detector = provideSuperHeroesDetector()
        return CaptureSuperHero(superHeroesDetector: detector)
    }

    private static func provideSuperHeroesDetector() -> SuperHeroesDetector {
        let apiClient = provideSuperHeroesAPIClient()
        return SuperHeroesDetector(apiClient: apiClient,
                                   capturedSuperHeroesStorage: CapturedSuperHeroesStorage())
    }

    private static func provideSuperHeroesAPIClient() -> SuperHeroesAPIClient {
        return FakeSuperHeroesAPIClient()
    }

    private static var storyBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }()

}

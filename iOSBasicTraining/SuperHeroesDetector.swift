//
//  SuperHeroesDetector.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result

class SuperHeroesDetector {

    fileprivate let superHeroesRepository: SuperHeroesRepository

    init(superHeroesRepository: SuperHeroesRepository) {
        self.superHeroesRepository = superHeroesRepository
    }

    func getSuperHeroes(_ completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void) {
        superHeroesRepository.getAll { result in
            completion(result)
        }
    }

    func captureSuperHero(_ id: String) -> Result<String, SuperHeroesDetectorError> {
        guard !id.isEmpty else {
            return Result(error: SuperHeroesDetectorError.superHeroNotFound)
        }
        return superHeroesRepository.markSuperHeroAsCaptured(id)
    }

}

//
//  GetSuperHeroes.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente on 26/6/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result

class GetSuperHeroes {

    private let superHeroesDetector: SuperHeroesDetector

    init(superHeroesDetector: SuperHeroesDetector) {
        self.superHeroesDetector = superHeroesDetector
    }

    func getAll(completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void) {
        superHeroesDetector.getSuperHeroes { result in
            completion(result)
        }
    }
}

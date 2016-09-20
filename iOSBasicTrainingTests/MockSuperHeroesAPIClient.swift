//
//  MockSuperHeroesAPIClient.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result
@testable import iOSBasicTraining

class MockSuperHeroesAPIClient: SuperHeroesAPIClient {

    var superHeroes: [SuperHero]?
    var getSuperHeroesError: SuperHeroesDetectorError?

    func getAllSuperHeroes(_ completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void) {
        if let superHeroes = superHeroes {
            completion(Result(superHeroes))
        } else if let getSuperHeroesError = getSuperHeroesError {
            completion(Result(error: getSuperHeroesError))
        }
    }

}

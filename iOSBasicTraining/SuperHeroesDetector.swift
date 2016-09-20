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

    fileprivate let apiClient: SuperHeroesAPIClient
    fileprivate let capturedSuperHeroesStorage: CapturedSuperHeroesStorage

    init(apiClient: SuperHeroesAPIClient, capturedSuperHeroesStorage: CapturedSuperHeroesStorage) {
        self.apiClient = apiClient
        self.capturedSuperHeroesStorage = capturedSuperHeroesStorage
    }

    func getSuperHeroes(_ completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void) {
        return apiClient.getAllSuperHeroes { result in
            switch result {
            case .success(let superHeroes):
                let nonCapturedSuperHeroes = superHeroes.filter {
                    !self.capturedSuperHeroesStorage.isSuperHeroCaptured($0.id)
                }
                completion(Result(nonCapturedSuperHeroes))
                break
            case .failure(let apiClientError):
                completion(Result(error: apiClientError))
            }
        }
    }

    func captureSuperHero(_ id: String) -> Result<String, SuperHeroesDetectorError> {
        guard !id.isEmpty else {
            return Result(error: SuperHeroesDetectorError.superHeroNotFound)
        }
        capturedSuperHeroesStorage.markSuperHeroAsCaptured(id)
        return Result(id)
    }

}

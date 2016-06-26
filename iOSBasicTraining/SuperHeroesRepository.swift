//
//  SuperHeroesRepository.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente on 26/6/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result

class SuperHeroesRepository {

    private let apiClient: SuperHeroesAPIClient
    private let capturedSuperHeroesStorage: CapturedSuperHeroesStorage

    init(apiClient: SuperHeroesAPIClient, capturedSuperHeroesStorage: CapturedSuperHeroesStorage) {
        self.apiClient = apiClient
        self.capturedSuperHeroesStorage = capturedSuperHeroesStorage
    }

    func getAll(completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void) {
        return apiClient.getAllSuperHeroes { result in
            switch result {
            case .Success(let superHeroes):
                let nonCapturedSuperHeroes = superHeroes.filter {
                    !self.capturedSuperHeroesStorage.isSuperHeroCaptured($0.id)
                }
                completion(Result(nonCapturedSuperHeroes))
                break
            case .Failure(let apiClientError):
                completion(Result(error: apiClientError))
            }
        }
    }

    func markSuperHeroAsCaptured(id: String) -> Result<String, SuperHeroesDetectorError> {
        capturedSuperHeroesStorage.markSuperHeroAsCaptured(id)
        return Result(id)
    }

}

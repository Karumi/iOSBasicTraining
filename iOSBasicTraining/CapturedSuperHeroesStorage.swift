//
//  CapturedSuperHeroesStorage.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class CapturedSuperHeroesStorage {
    private var storage: [String: Bool] = [:]

    func isSuperHeroCaptured(superHeroId: String) -> Bool {
        return storage[superHeroId] ?? false
    }

    func markSuperHeroAsCaptured(superHeroId: String) {
        storage[superHeroId] = true
    }

    func clear() {
        storage = [:]
    }
}

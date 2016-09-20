//
//  CapturedSuperHeroesStorage.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class CapturedSuperHeroesStorage {

    fileprivate static let storageName = "CapturedSuperHeroesStorage"

    fileprivate let userDefaults: UserDefaults

    init() {
        userDefaults = UserDefaults.init(suiteName: CapturedSuperHeroesStorage.storageName)!
    }

    func isSuperHeroCaptured(_ superHeroId: String) -> Bool {
        return userDefaults.bool(forKey: superHeroId)
    }

    func markSuperHeroAsCaptured(_ superHeroId: String) {
        userDefaults.set(true, forKey: superHeroId)
    }

    func clear() {
        for superHeroId in userDefaults.dictionaryRepresentation().keys {
            userDefaults.removeObject(forKey: superHeroId)
        }
    }

}

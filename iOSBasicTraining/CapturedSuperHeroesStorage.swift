//
//  CapturedSuperHeroesStorage.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class CapturedSuperHeroesStorage {

    private static let storageName = "CapturedSuperHeroesStorage"

    private let userDefaults: NSUserDefaults

    init() {
        userDefaults = NSUserDefaults.init(suiteName: CapturedSuperHeroesStorage.storageName)!
    }

    func isSuperHeroCaptured(superHeroId: String) -> Bool {
        return userDefaults.boolForKey(superHeroId)
    }

    func markSuperHeroAsCaptured(superHeroId: String) {
        userDefaults.setBool(true, forKey: superHeroId)
    }

    func clear() {
        userDefaults.removeSuiteNamed(CapturedSuperHeroesStorage.storageName)
    }

}

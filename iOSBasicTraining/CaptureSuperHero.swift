//
//  CaptureSuperHero.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente on 26/6/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result

class CaptureSuperHero {

    fileprivate let superHeroesDetector: SuperHeroesDetector

    init(superHeroesDetector: SuperHeroesDetector) {
        self.superHeroesDetector = superHeroesDetector
    }

    func capture(_ id: String) -> Result<String, SuperHeroesDetectorError> {
        return superHeroesDetector.captureSuperHero(id)
    }

}

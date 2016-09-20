//
//  SuperHeroesAPIClient.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result

protocol SuperHeroesAPIClient {

    func getAllSuperHeroes(_ completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void)

}

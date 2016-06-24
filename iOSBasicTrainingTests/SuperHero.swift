//
//  SuperHero.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
@testable import iOSBasicTraining

extension SuperHero: Equatable {

}

func == (lhs: SuperHero, rhs: SuperHero) -> Bool {
    return lhs.id == rhs.id
}

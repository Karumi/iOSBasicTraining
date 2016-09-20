//
//  SuperHeroesBuilder.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
@testable import iOSBasicTraining

class SuperHeroesBuilder {

    static func with(id: String = "1",
                     name: String = "The Flash",
                     description: String? = nil,
                     image: URL? = nil,
                     comics: [Comic] = [Comic]()) -> SuperHero {
        return SuperHero(id: id, name: name, description: description, image: image as URL?, comics: comics)
    }

}

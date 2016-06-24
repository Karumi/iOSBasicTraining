//
//  SuperHeroTests.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Nimble
import XCTest
@testable import iOSBasicTraining

class SuperHeroesTests: XCTestCase {


    func testASuperHeroIsAnAvengerIfTheIdContainsTheNumberFour() {
        let superHero = SuperHeroesBuilder.with(id: "1234")

        let isAvenger = superHero.isAvenger()

        expect(isAvenger).to(beTrue())
    }

    func testASuperHeroIsNotAnAvengerIfTheIdDoesNotContainTheNumberFour() {
        let superHero = SuperHeroesBuilder.with(id: "123")

        let isAvenger = superHero.isAvenger()

        expect(isAvenger).to(beFalse())
    }

    func testTheSuperHeroFormalDescriptionIsComposedByTheNameAndTheRegularDescription() {
        let name = "The Flash"
        let description = "The fastest man alive!"
        let superHero = SuperHeroesBuilder.with(name: name, description: description)

        let formalDescription = superHero.formalDescription

        expect(formalDescription).to(equal("\(name) - \(description)"))
    }

    func testTheSuperHeroFormalDescriptionShouldIndicateTheDescriptionIsNotProvidedIfTheValueIsNil() {
        let name = "3D Man"
        let superHero = SuperHeroesBuilder.with(name: name, description: nil)

        let formalDescription = superHero.formalDescription

        expect(formalDescription).to(equal("\(name) - No description provided."))
    }

}

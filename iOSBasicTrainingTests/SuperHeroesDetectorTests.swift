//
//  SuperHeroesDetectorTests.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import XCTest
import Nimble
import Result
@testable import iOSBasicTraining

class SuperHeroesDetectorTests: XCTestCase {

    fileprivate let storage = CapturedSuperHeroesStorage()
    fileprivate let apiClient = MockSuperHeroesAPIClient()

    override func tearDown() {
        storage.clear()
        super.tearDown()
    }

    func testRetunsSuperHeroesObtainedFromTheAPIIfNoOneHasBeenMarkedAsCaptured() {
        let apiSuperHeroes = givenThereAreSomeSuperHeroes()
        let superHeroesDetector = givenASuperHeroesDetector()

        var result: Result<[SuperHero], SuperHeroesDetectorError>?
        superHeroesDetector.getSuperHeroes { response in
            result = response
        }

        expect(result?.value).toEventually(equal(apiSuperHeroes))
    }

    func testReturnsConnectionErrorIfThereIsNoConnectionRetrieveingSuperHeroes() {
        givenThereIsNoConnection()
        let superHeroesDetector = givenASuperHeroesDetector()

        var result: Result<[SuperHero], SuperHeroesDetectorError>?
        superHeroesDetector.getSuperHeroes { response in
            result = response
        }

        expect(result?.error).toEventually(equal(SuperHeroesDetectorError.connectionError))
    }

    func testReturnsAnEmptyListOfSuperHeroesIfThereAreNoSuperHeroes() {
        givenThereAreNoSuperHeroes()
        let superHeroesDetector = givenASuperHeroesDetector()

        var result: Result<[SuperHero], SuperHeroesDetectorError>?
        superHeroesDetector.getSuperHeroes { response in
            result = response
        }

        expect(result?.value).toEventually(beEmpty())
    }

    func testDoesNotReturnSuperHeroesMarkedAsCaptured() {
        let superHeroesDetector = givenASuperHeroesDetector()
        let apiSuperHeroes = givenThereAreSomeSuperHeroes(5)

        superHeroesDetector.captureSuperHero(apiSuperHeroes[3].id)
        var result: Result<[SuperHero], SuperHeroesDetectorError>?
        superHeroesDetector.getSuperHeroes { response in
            result = response
        }

        expect(result?.value?.count).toEventually(equal(4))
        expect(result?.value).toEventuallyNot(contain(apiSuperHeroes[3]))
        expect(result?.value).toEventually(contain(apiSuperHeroes[0]))
        expect(result?.value).toEventually(contain(apiSuperHeroes[1]))
        expect(result?.value).toEventually(contain(apiSuperHeroes[2]))
        expect(result?.value).toEventually(contain(apiSuperHeroes[4]))
    }

    fileprivate func givenThereAreNoSuperHeroes() {
        givenThereAreSomeSuperHeroes(0)
    }

    fileprivate func givenThereIsNoConnection() {
        apiClient.getSuperHeroesError = .connectionError
    }

    fileprivate func givenThereAreSomeSuperHeroes(_ numberOfSuperHeroes: Int = 10) -> [SuperHero] {
        var superHeroes = [SuperHero]()
        for i in 0..<numberOfSuperHeroes {
            let superHero = SuperHeroesBuilder.with(id: "\(i)",
                                                    name: "Name \(i)",
                                                    description: "Description \(i)")
            superHeroes.append(superHero)
        }
        apiClient.superHeroes = superHeroes
        return superHeroes
    }

    fileprivate func givenASuperHeroesDetector() -> SuperHeroesDetector {
        return SuperHeroesDetector(apiClient: apiClient, capturedSuperHeroesStorage: storage)
    }

}

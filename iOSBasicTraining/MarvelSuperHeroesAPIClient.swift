//
//  MarvelSuperHeroesAPIClient.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import Result
import MarvelAPIClient

class MarvelSuperHeroesAPIClient: SuperHeroesAPIClient {

    private let charactersAPIClient: CharactersAPIClient

    init() {
        MarvelAPIClient.configureCredentials(
            publicKey: "54355f684e1983a183d7bfec96a4bf81",
            privateKey: "4ad71e7b61e40311545909af0d6ebbd52bbfeae3")
        self.charactersAPIClient = MarvelAPIClient.charactersAPIClient
    }

    func getAllSuperHeroes(completion: (Result<[SuperHero], SuperHeroesDetectorError>) -> Void) {
        charactersAPIClient.getAll(offset: 0, limit: 20) { result in
            dispatch_async(dispatch_get_main_queue(), {
                switch result {
                case .Success(let characters):
                    let superHeroes = self.mapSuperHeroes(characters)
                    completion(Result(superHeroes))
                    break
                case .Failure:
                    completion(Result(error: SuperHeroesDetectorError.ConnectionError))
                }
            })
        }
    }

    private func mapSuperHeroes(characters: GetCharactersDTO) -> [SuperHero] {
        guard let characters = characters.characters else {
            return [SuperHero]()
        }
        return characters.map { character in
            SuperHero(id: character.id,
                name: character.name ?? "",
                description: character.description,
                image: character.thumbnail?.URL(.LandscapeExtraLarge),
                comics: mapComics(character.comics))
        }
    }

    private func mapComics(comics: [ComicDTO]?) -> [Comic] {
        guard let comics = comics else {
            return [Comic]()
        }
        return comics.map { comic in
            Comic(name: comic.name)
        }
    }
}

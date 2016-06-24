//
//  SuperHero.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

struct SuperHero {

    let id: String
    let name: String
    let description: String?
    let image: NSURL?
    let comics: [Comic]

    var formalDescription: String {
        get {
            return "\(name) - \(description ?? "No description provided.")"
        }
    }

    func isAvenger() -> Bool {
        return id.containsString("4")
    }

}

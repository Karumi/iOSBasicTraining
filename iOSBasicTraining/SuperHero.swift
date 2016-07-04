//
//  SuperHero.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

struct SuperHero: CustomDebugStringConvertible  {

    let id: String
    let name: String
    let description: String?
    let comics: [Comic]

    var formalDescription: String {
        return "\(name) - \(description ?? "No description provided.")"
    }

    func isAvenger() -> Bool {
        return id.containsString("4")
    }

    var debugDescription: String {
        return "\(id) \(name) \(description)"
    }
}

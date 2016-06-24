//
//  Presenter.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

protocol Presenter {

    func viewDidLoad()
    func viewWillAppear()

}

protocol View: class {

    func showMessage(message: String)

}

extension Presenter {

    func viewDidLoad() { }
    func viewWillAppear() { }

}

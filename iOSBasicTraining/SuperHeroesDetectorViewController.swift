//
//  SuperHeroesDetectorViewController.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import Toast

class SuperHeroesDetectorViewController: UIViewController, View {

    func showMessage(message: String) {
        view.makeToast(message)
    }

}

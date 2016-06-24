//
//  ViewController.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
import Toast

class SuperHeroesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCaseView: UIView!
    @IBOutlet weak var errorCaseView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    private let superHeroesDetector = SuperHeroesDetector(
        apiClient: FakeSuperHeroesAPIClient(),
        capturedSuperHeroesStorage: CapturedSuperHeroesStorage())
    private var superHeroes = [SuperHero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarTitle()
        configureTableView()
        configureNavigationBarBackButton()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadSuperHeroes()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SuperHeroTableViewCell", forIndexPath: indexPath) as! SuperHeroTableViewCell
        let hero = superHeroes[indexPath.row]
        cell.configureForHero(hero)
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let superHero = superHeroes[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("SuperHeroDetailViewController") as! SuperHeroDetailViewController
        viewController.superHero = superHero
        navigationController?.pushViewController(viewController, animated: true)
    }

    private func loadSuperHeroes() {
        activityIndicatorView.startAnimating()
        superHeroesDetector.getSuperHeroes { result in
            self.activityIndicatorView.stopAnimating()
            switch result {
            case .Success(let superHeroes):
                self.showSuperHeroes(superHeroes)
                break
            case .Failure(let error):
                self.showError(error)
                break
            }
        }
    }

    private func showSuperHeroes(superHeroes: [SuperHero]) {
        self.superHeroes = superHeroes
        tableView.reloadData()
        emptyCaseView.hidden = !superHeroes.isEmpty
        errorCaseView.hidden = true
    }

    private func showError(error: SuperHeroesDetectorError) {
        switch error {
        case .ConnectionError:
            emptyCaseView.hidden = true
            errorCaseView.hidden = !superHeroes.isEmpty
            if superHeroes.isEmpty {
                view.makeToast("Ups, there is no connection!")
            }
            break
        default:
            if superHeroes.isEmpty {
                errorCaseView.hidden = true
            } else {
                view.makeToast("Ups, unknown error detected!")
            }
            fatalError()
        }
    }

    private func configureNavigationBarTitle() {
        title = "Super Heroes Detector"
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

    private func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
    }
}

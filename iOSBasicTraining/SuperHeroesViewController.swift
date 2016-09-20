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

    fileprivate let superHeroesDetector = SuperHeroesDetector(
        apiClient: FakeSuperHeroesAPIClient(),
        capturedSuperHeroesStorage: CapturedSuperHeroesStorage())
    fileprivate var superHeroes = [SuperHero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarTitle()
        configureTableView()
        configureNavigationBarBackButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSuperHeroes()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroTableViewCell", for: indexPath) as! SuperHeroTableViewCell
        let hero = superHeroes[(indexPath as NSIndexPath).row]
        cell.configureForHero(hero)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let superHero = superHeroes[(indexPath as NSIndexPath).row]
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SuperHeroDetailViewController") as! SuperHeroDetailViewController
        viewController.superHero = superHero
        navigationController?.pushViewController(viewController, animated: true)
    }

    fileprivate func loadSuperHeroes() {
        activityIndicatorView.startAnimating()
        superHeroesDetector.getSuperHeroes { result in
            self.activityIndicatorView.stopAnimating()
            switch result {
            case .success(let superHeroes):
                self.showSuperHeroes(superHeroes)
                break
            case .failure(let error):
                self.showError(error)
                break
            }
        }
    }

    fileprivate func showSuperHeroes(_ superHeroes: [SuperHero]) {
        self.superHeroes = superHeroes
        tableView.reloadData()
        emptyCaseView.isHidden = !superHeroes.isEmpty
        errorCaseView.isHidden = true
    }

    fileprivate func showError(_ error: SuperHeroesDetectorError) {
        switch error {
        case .connectionError:
            emptyCaseView.isHidden = true
            errorCaseView.isHidden = !superHeroes.isEmpty
            if superHeroes.isEmpty {
                view.makeToast("Ups, there is no connection!")
            }
            break
        default:
            if superHeroes.isEmpty {
                errorCaseView.isHidden = true
            } else {
                view.makeToast("Ups, unknown error detected!")
            }
            fatalError()
        }
    }

    fileprivate func configureNavigationBarTitle() {
        title = "Super Heroes Detector"
    }

    fileprivate func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

    fileprivate func configureNavigationBarBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}

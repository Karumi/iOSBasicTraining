//
//  ViewController.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit
import Toast

class SuperHeroesViewController: SuperHeroesDetectorViewController,
                        UITableViewDataSource, UITableViewDelegate, SuperHeroesView {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyCaseView: UIView!
    @IBOutlet weak var errorCaseView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var presenter: SuperHeroesPresenter!

    var superHeroes = [SuperHero]() {
        didSet {
            tableView.reloadData()
        }
    }

    var showingEmptyCase: Bool {
        get {
            return !emptyCaseView.isHidden
        }
        set {
            emptyCaseView.isHidden = !showingEmptyCase
        }
    }

    var showingErrorCase: Bool {
        get {
            return !errorCaseView.isHidden
        }
        set {
            errorCaseView.isHidden = !showingErrorCase
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarTitle()
        configureTableView()
        configureNavigationBarBackButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    func showLoading() {
        activityIndicatorView.startAnimating()
    }

    func hideLoading() {
        activityIndicatorView.stopAnimating()
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
        let viewController = SuperHeroesDetectorServiceLocator.provideSuperHeroDetailViewController(superHero)
        navigationController?.pushViewController(viewController, animated: true)
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

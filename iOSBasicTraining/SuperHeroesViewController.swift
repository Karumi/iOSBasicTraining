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
            return !emptyCaseView.hidden
        }
        set {
            emptyCaseView.hidden = !newValue
        }
    }

    var showingErrorCase: Bool {
        get {
            return !errorCaseView.hidden
        }
        set {
            errorCaseView.hidden = !newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBarTitle()
        configureTableView()
        configureNavigationBarBackButton()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    func showLoading() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidden = false
    }

    func hideLoading() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.hidden = true
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
        let viewController = SuperHeroesDetectorServiceLocator.provideSuperHeroDetailViewController(superHero)
        navigationController?.pushViewController(viewController, animated: true)
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

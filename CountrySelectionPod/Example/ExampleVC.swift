//
//  ExampleVC.swift
//  CountrySelectionPod
//
//  Created by Fedor Volchkov on 10/8/19.
//  Copyright © 2019 Fedor Volchkov. All rights reserved.
//

import Foundation
import UIKit

final class ExampleVC: UIViewController {
    
    private let tableView = UITableView()
    private let countrySelection = CountrySelection()
    private var countries: [Country]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        countries = try? countrySelection.getCountriesList()
    }
}

extension ExampleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.imageView?.image = countries?[indexPath.item].flag
        cell.textLabel?.text = countries?[indexPath.item].name
        return cell
    }
    
    
}

//
//  SettingController.swift
//  FITKUB
//
//  Created by Nathat Kuanthanom on 19/2/2567 BE.
//

import UIKit

class SettingController: UIViewController {
    // MARK: - Varibles
    let settingTitles: [String] = ["Profile", "Language", "Notification"]
    
    // MARK: - UI Components
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.backgroundColor = .fitkunPink
        button.tintColor = .fitkubBackground
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavbar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    
    // MARK: - UI Setup
    func setupNavbar() {
        navigationItem.title = "Setting"
        navigationController?.navigationBar.tintColor = .fitkubGreen
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(signOutButton)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            signOutButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func configureCell(cell: UITableViewCell, rowIndex: Int) {
        cell.textLabel?.text = settingTitles[rowIndex]
        cell.textLabel?.textColor = .label
        cell.selectionStyle = .blue
    }
    // MARK: - Selectors
    
}

extension SettingController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell: cell, rowIndex: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Debugger: select \(settingTitles[indexPath.row])")
    }
}

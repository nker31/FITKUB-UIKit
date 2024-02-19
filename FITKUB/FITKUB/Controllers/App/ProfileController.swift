//
//  ProfileController.swift
//  HealthKub
//
//  Created by Nathat Kuanthanom on 15/2/2567 BE.
//

import UIKit

class ProfileController: UIViewController {

    // MARK: - Varibles
    
    
    // MARK: - UI Components
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .fitkubGreen
        return view
    }()
    
    var profileImageView: UIImageView = {
        let image = UIImage(named: "simpson")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sam Smooth"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .fitkubBackground
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavbar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    func setupUI() {
       
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        headerView.addSubview(profileNameLabel)
        headerView.addSubview(profileImageView)
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileNameLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            profileNameLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -15),
            
            profileImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: profileNameLabel.topAnchor, constant: -15),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func setupNavbar() {
        navigationItem.title = ""
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(didTapSettingButton))
        navigationItem.rightBarButtonItem = settingButton
        navigationController?.navigationBar.tintColor = .fitkubBackground
    }
    
    // MARK: - Selectors
    @objc func didTapSettingButton() {
        print("Debugger: Tap Setting")
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(SettingController(), animated: true)
        hidesBottomBarWhenPushed = false
    }
}

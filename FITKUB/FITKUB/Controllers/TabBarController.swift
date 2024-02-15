//
//  TabBarController.swift
//  HealthKub
//
//  Created by Nathat Kuanthanom on 15/2/2567 BE.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    }
    
    // MARK: - UI Setup
    private func setupTab() {
        self.tabBar.barTintColor = .systemBackground
        self.tabBar.tintColor = .fitkubGreen
        
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let diary = self.createNav(with: "Food Diary", and: UIImage(systemName: "book"), vc: FoodDiaryController())
        let profile = self.createNav(with: "Profile", and: UIImage(systemName: "person"), vc: ProfileController())
        
        self.setViewControllers([home, diary, profile], animated: true)
    }
    
    private func createNav(with title:String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        return nav
    }
}

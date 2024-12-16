//
//  MainTabBarController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 25.11.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainVC = MainViewController()
        
        let firstViewController = UIViewController()
        firstViewController.view?.backgroundColor = .red
        
        let secondViewController = UIViewController()
        secondViewController.view?.backgroundColor = .orange
        
        let thirdViewController = UIViewController()
        thirdViewController.view?.backgroundColor = .yellow
        
        let fourViewController = UIViewController()
        fourViewController.view?.backgroundColor = .green
        
        viewControllers = [
            setupTabBarItem(for: mainVC, title: "Главная", imageName: "1.square.fill", tag: 0),
            setupTabBarItem(for: firstViewController, title: "Первый", imageName: "2.square.fill", tag: 1),
            setupTabBarItem(for: secondViewController, title: "Второй", imageName: "3.square.fill", tag: 2),
            setupTabBarItem(for: thirdViewController, title: "Третий", imageName: "4.square.fill", tag: 3),
            setupTabBarItem(for: fourViewController, title: "Четвертый", imageName: "5.square.fill", tag: 4)
        ]
    }
    
    private func setupTabBarItem(for viewController: UIViewController,
                                 title: String,
                                 imageName: String,
                                 tag: Int) -> UIViewController {
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            tag: tag
        )
        return viewController
    }
}

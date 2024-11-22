//
//  MainViewController.swift
//  VIGT App
//
//  Created by Наталья Коновалова on 21.11.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var backgroundImageView = {
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: IconNames.mainBackgroundImage2)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
}



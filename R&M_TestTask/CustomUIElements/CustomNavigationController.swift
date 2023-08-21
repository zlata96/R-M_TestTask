// CustomNavigationController.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

class CustomNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .mainBackground
        navigationBar.prefersLargeTitles = true
        setupStyle()
    }

    private func setupStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainBackground
        appearance.largeTitleTextAttributes = [
            .font: UIFont.text1B,
            .foregroundColor: UIColor.white
        ]
        appearance.titlePositionAdjustment = .init(horizontal: 16, vertical: 0)
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [
            .font: UIFont.text1B,
            .foregroundColor: UIColor.white
        ]
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
}

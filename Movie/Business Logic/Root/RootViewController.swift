//
//  RootViewController.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

class RootViewController<ViewModelType: ViewModeling>: UITabBarController {

    var viewModel: ViewModelType!

    init(viewModel: ViewModelType, modules: [UIViewController]) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.initialSetup()
        self.setViewControllers(modules, animated: false)
        self.tabBar.tintColor = .red
        self.tabBar.scrollEdgeAppearance = UITabBarAppearance(barAppearance: self.tabBar.standardAppearance)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Wrong initializer. Use init(viewModel:modules:) instead.")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Wrong initializer. Use init(viewModel:modules:) instead.")
    }

    func initialSetup() {}

    func setupUI() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear(animated)
    }
}

//
//  BaseViewController.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import SwiftUI

class BaseViewController<ViewModelType: ViewModeling, ViewType: View>: UIHostingController<ViewType> {

    weak var viewModel: ViewModelType!
    override var navigationController: UINavigationController? { nil }

    override init(rootView: ViewType) {
        super.init(rootView: rootView)
        initialSetup()
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initialSetup() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)

        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillDisappear(animated)
    }
}

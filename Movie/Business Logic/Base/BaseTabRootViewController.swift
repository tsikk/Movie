//
//  BaseTabRootViewController.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import SwiftUI

class BaseTabRootViewController<ViewModelType: ViewModeling, ViewType: View>: BaseViewController<ViewModelType, ViewType> {

    // MARK: - Life Cycle

    override func initialSetup() {
        super.initialSetup()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.barTintColor = .tabBarColor
    }


}

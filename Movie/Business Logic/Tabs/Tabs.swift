//
//  Tabs.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

enum Tabs: Int, CaseIterable {
    
    case movie = 0
    case favourite

    static var allSorted: [Tabs] {
        self.allCases.sorted(by: { $0.rawValue < $1.rawValue })
    }

    var title: String {
        switch self {
        case .movie:
            return "Movies"
        case .favourite:
            return "Favourite"
        }
    }

    var assosiatedImage: UIImage? {
        switch self {
        case .movie:
            let image = UIImage(systemName: "video.fill")
            return image
        case .favourite:
            let image = UIImage(systemName: "star.fill")
            return image
        }
    }
}

struct TabFactory {

    static func module(for tab: Tabs) -> UIViewController {
        switch tab {
        case .movie:
            return MovieAssembly.build().wrapped
        case .favourite:
            return FavouriteAssembly.build().wrapped
        }
    }

    static func barItem(for tab: Tabs) -> UITabBarItem {
        UITabBarItem(title: tab.title, image: tab.assosiatedImage, tag: tab.rawValue)
    }
}

fileprivate extension UIViewController {

    var wrapped: UIViewController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.isTranslucent = true

        return navigationController
    }
}

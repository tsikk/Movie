//
//  BaseRouting.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

protocol BaseRouting {
    var anyTopController: UIViewController? { get }
    var topNavigationController: UINavigationController? { get }
    var topTabBarController: UITabBarController? { get }
}

extension BaseRouting {

    private var rootController: UIViewController? {
        let root = UIViewController.keyWindow?.rootViewController
        return root?.children.first?.presentedViewController ?? root?.children.first ?? root
    }

    var topViewController: UIViewController? {
        let navigation = topNavigationController

        if navigation != nil { return nil }

        return rootController
    }

    var anyTopController: UIViewController? {
        rootController
    }

    var topNavigationController: UINavigationController? {
        rootController as? UINavigationController
    }

    var topTabBarController: UITabBarController? {
        rootController as? UITabBarController
    }
}

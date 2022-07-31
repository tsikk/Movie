//
//  BaseRouting.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import UIKit

protocol BaseRouting {
    var topViewController: UIViewController? { get }
    var anyTopController: UIViewController? { get }
    var topSplitController: UISplitViewController? { get }
    var topNavigationController: UINavigationController? { get }
    var topTabBarController: UITabBarController? { get }
    var tabTopNavigationController: UINavigationController? { get }
    func show(_ viewController: UIViewController, on tab: Tabs)
    func present(_ viewControllerToPresent: UIViewController, on tab: Tabs, animated: Bool, completion: (() -> Void)?)
}

extension BaseRouting {

    private var rootController: UIViewController? {
        let root = UIViewController.keyWindow?.rootViewController
        return root?.children.first?.presentedViewController ?? root?.children.first ?? root
    }

    var topViewController: UIViewController? {
        let split = topSplitController
        let navigation = topNavigationController
        let tabBar = topTabBarController

        if split != nil || navigation != nil || tabBar != nil {
            return nil
        }

        return rootController
    }

    var anyTopController: UIViewController? {
        rootController
    }

    var topSplitController: UISplitViewController? {
        rootController as? UISplitViewController
    }

    var topNavigationController: UINavigationController? {
        rootController as? UINavigationController
    }

    var topTabBarController: UITabBarController? {
        rootController as? UITabBarController
    }

    var tabTopNavigationController: UINavigationController? {
        topTabBarController?.selectedViewController as? UINavigationController
    }

    func show(_ viewController: UIViewController, on tab: Tabs) {
        let rootController = topTabBarController?.viewControllers?[tab.rawValue]

        rootController?.show(viewController, sender: nil)
        topTabBarController?.selectedIndex = tab.rawValue
    }

    func present(_ viewControllerToPresent: UIViewController, on tab: Tabs, animated: Bool, completion: (() -> Void)?) {
        let rootController = topTabBarController?.viewControllers?[tab.rawValue] as? UINavigationController
        let presentationController = rootController?.viewControllers.last

        presentationController?.present(viewControllerToPresent, animated: animated, completion: completion)
        topTabBarController?.selectedIndex = tab.rawValue
    }
}

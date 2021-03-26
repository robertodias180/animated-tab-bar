//
//  UIViewController+Extensions.swift
//  RAMAnimatedTabBarDemo
//
//  Created by Roberto Dias on 26/03/2021.
//  Copyright © 2021 Ramotion. All rights reserved.
//

import UIKit

extension UIViewController {
    func topPresentedController() -> UIViewController {
        if let tab = self as? UITabBarController, let selectedViewController = tab.selectedViewController {
            return selectedViewController.topPresentedController()
        } else if let nav = self as? UINavigationController, let topViewController = nav.topViewController {
            return topViewController.topPresentedController()
        } else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topPresentedController()
        } else {
            return self
        }
    }
    
    func topPresentingController() -> UIViewController? {
        if let tab = self as? UITabBarController, let selectedViewController = tab.selectedViewController {
            let vc = selectedViewController.topPresentingController()
            return vc ?? self.presentingViewController
        } else if let nav = self as? UINavigationController, let topViewController = nav.topViewController {
            let vc = topViewController.topPresentingController()
            return vc ?? self.presentingViewController
        } else if let presentedViewController = self.presentedViewController {
            let vc = presentedViewController.topPresentingController()
            return vc ?? self.presentingViewController
        } else {
            return self.presentingViewController
        }
    }
    
    func topNavigationController() -> UINavigationController? {
        if let tab = self as? UITabBarController, let selectedViewController = tab.selectedViewController {
            return selectedViewController.topNavigationController()
        } else if let nav = self as? UINavigationController, let topViewController = nav.topViewController {
            return topViewController.topNavigationController() ?? nav
        } else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topNavigationController()
        } else {
            return nil
        }
    }
}


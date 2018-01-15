//
//  TabBarViewController.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import UIKit

enum TabBarItems: String {
    case Movies
    case TvShows
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var storyBoard: UIStoryboard?
    var arrayVc: [UIViewController]?
    var itemController: TabBarItemController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        arrayVc = []
        arrayVc?.append(setViewControllerForTabBarItem(itemType: .Movies))
        arrayVc?.append(setViewControllerForTabBarItem(itemType: .TvShows))
        viewControllers = arrayVc
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

private extension TabBarController{
    
    func setViewControllerForTabBarItem(itemType: TabBarItems)-> UIViewController {
        itemController =  TabBarItemController(itemType: itemType)
        itemController.controller.tabBarItem = UITabBarItem(title: itemType.rawValue, image: UIImage(named: itemController.imageDisabled )!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:itemController.imageEnbled))
        let viewController = UINavigationController(rootViewController: itemController.controller)
        return viewController
    }
}


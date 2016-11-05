//
//  PageViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 05.11.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import Foundation

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource {
    
    var viewControllers: [UIViewController]!
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    override func viewDidLoad() {
        viewControllers = [
            storyboard!.instantiateViewController(withIdentifier: "One"),
            storyboard!.instantiateViewController(withIdentifier: "Two"),
        ]
        pageViewController.dataSource = self
        
        //set first View Controller
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
        
        // Add page view Controller as a child of the main View controller
        self.addChildViewController(pageViewController)
        
        // make pageview same size as current view
        pageViewController.view.frame = self.view.frame
        
        // Add view, and complete child view controller transition
        self.view.addSubview(pageViewController.view)
        pageViewController.didMove(toParentViewController: self)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.index(of: viewController) else {
            return viewController //if the currently displayed on is not in the viewcontrollers list we have issues
        }
        guard (viewControllers.startIndex..<viewControllers.endIndex).contains(index + 1) else { //will the next one be in the array
            return nil
        }
        return viewControllers[index + 1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.index(of: viewController) else {
            return viewController //if the currently displayed on is not in the viewcontrollers list we have issues
        }
        guard (viewControllers.startIndex..<viewControllers.endIndex).contains(index - 1) else { //will the previous one be in the array
            return nil
        }
        return viewControllers[index - 1]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return viewControllers.count //how many buttons
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0 //which button does the first VC correspond with
    }
    
}

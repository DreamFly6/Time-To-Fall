//
//  TutorialViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 2/3/16.
//  Copyright © 2016 Seven Even. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var MenuButton: UIButton!
    var swipePageViewController: SwipePageViewController? {
        didSet {
            swipePageViewController?.swipeDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pageControl.addTarget(self, action: #selector(TutorialViewController.didChangePageControlValue), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let swipePageViewController = segue.destination as? SwipePageViewController {
            self.swipePageViewController = swipePageViewController
        }
    }


}

extension SwipeViewController: SwipePageViewControllerDelegate {
    
    func swipePageViewController(_ swipePageViewController: SwipePageViewController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
        //MenuButton.setBackgroundImage(UIImage(named: "MenuSelect"+String(count)+".png"), for: UIControlState.normal)
    }
    
    func swipePageViewController(_ swipePageViewController: SwipePageViewController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
        let selector = "MenuSelect"+String(index + 1)+".png"
        print(selector)
        MenuButton.setBackgroundImage(UIImage(named: selector), for: UIControlState.normal)
    }
    
}

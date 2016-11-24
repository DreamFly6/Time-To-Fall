//
//  TutorialViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 2/3/16.
//  Copyright © 2016 Seven Even. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var MenuButton: UIButton!
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pageControl.addTarget(self, action: #selector(TutorialViewController.didChangePageControlValue), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }


}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
        //MenuButton.setBackgroundImage(UIImage(named: "MenuSelect"+String(count)+".png"), for: UIControlState.normal)
    }
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
        let selector = "MenuSelect"+String(index + 1)+".png"
        print(selector)
        MenuButton.setBackgroundImage(UIImage(named: selector), for: UIControlState.normal)
    }
    
}

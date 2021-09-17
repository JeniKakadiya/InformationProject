//
//  PageViewController.swift
//  informationData
//
//  Created by Jeni kakadiya on 6/30/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    lazy var viewcontrollerList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let firstViewcontroller = storyboard.instantiateViewController(identifier: "FirstPageViewController")
        let signupViewcontroller = storyboard.instantiateViewController(identifier: "SignupViewController")
        return [firstViewcontroller, signupViewcontroller]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       dataSource = self
        if let vc = viewcontrollerList.first{
            self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }

}

//pageViewController DataSource
extension PageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       // return nil
        guard let index = viewcontrollerList.lastIndex(of: viewController) else {
            return nil
        }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {return nil}
       guard previousIndex < viewcontrollerList.count else {return nil}

        return viewcontrollerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      //  return nil
       guard let index = viewcontrollerList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index + 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < viewcontrollerList.count else {return nil}
        return viewcontrollerList[previousIndex]

    }
    
   
}










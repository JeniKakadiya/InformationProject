//
//  FirstPageViewController.swift
//  informationData
//
//  Created by Jeni kakadiya on 6/30/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {
  
    private let scrollview = UIScrollView()
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.backgroundColor = .white
        return pageControl
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     //   pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        view.addSubview(pageControl)
    }
  /*
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollview.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height-100, width: view.frame.size.width-20, height: 50)
    }

}

//
//  StopwatchPageVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/22/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class StopwatchPageVC: UIPageViewController {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [newColoredViewController(number: "0"),
                newColoredViewController(number: "1"),
                newColoredViewController(number: "2")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
    }
    
    private func newColoredViewController(number: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "StopwatchView\(number)")
    }
    
    if let firstViewController = orderedViewControllers.first as? UIViewController {
        setViewControllers([firstViewController],
                           direction: .Forward,
                           animated: true,
                           completion: nil)
    }
    

}

// MARK: UIPageViewControllerDataSource

extension StopwatchPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
}



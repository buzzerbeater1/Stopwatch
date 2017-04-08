//
//  Page1VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page1VC: UIViewController, UIScrollViewDelegate {

    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let scrollView = UIScrollView(frame: super.view.bounds)
        
        
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.black
        let contentWidth = scrollView.bounds.width
        let contentHeight = scrollView.bounds.height
        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        let frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        let subview = UIImageView(frame: frame)
        subview.image = UIImage(named: "FL")
        subview.contentMode = .scaleAspectFit
        super.view.addSubview(scrollView)
        scrollView.addSubview(subview)
      
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

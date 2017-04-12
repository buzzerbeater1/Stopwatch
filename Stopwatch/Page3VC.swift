//
//  Page3VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page3VC: UIViewController, UIScrollViewDelegate {
    
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scrollView.delegate = self
//        scrollView.backgroundColor = UIColor.black
//        let contentWidth = scrollView.bounds.width
//        let contentHeight = scrollView.bounds.height*1.5
//        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
//        let frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
//        let subview = UIImageView(frame: frame)
//        subview.image = UIImage(named: "RL")
//        subview.contentMode = .scaleAspectFit
//        scrollView.addSubview(subview)
//        
//        
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

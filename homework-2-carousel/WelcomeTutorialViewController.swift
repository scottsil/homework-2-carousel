//
//  WelcomeTutorialViewController.swift
//  homework-2-carousel
//
//  Created by Scott Silverman on 2/15/15.
//  Copyright (c) 2015 Scott Silverman. All rights reserved.
//

import UIKit

class WelcomeTutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeScrollView.contentSize = CGSize(width: 1280, height: welcomeScrollView.bounds.size.height)
        welcomeScrollView.delegate = self
        getStartedScrollView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var page = Int(welcomeScrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        if(page == 3){
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.getStartedScrollView.alpha = 1
            })
        } else {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.getStartedScrollView.alpha = 0
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

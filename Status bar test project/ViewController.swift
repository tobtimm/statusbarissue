//
//  ViewController.swift
//  Status bar test project
//
//  Created by Tobias Timm on 2017-09-27.
//  Copyright © 2017 Tobias Timm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleBarView: UIView!
    
    var statusBarHidden: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return self.statusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    @IBAction func tappedBackground(sender: UITapGestureRecognizer) {
        if self.titleBarView.alpha == 0 {
            fadeInViews()
        } else {
            fadeOutViews()
        }
    }
 
    func fadeOutViews() {
        //Add top margin to super view
        let topMarginConstraint = NSLayoutConstraint(item: self.titleBarView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: self.titleBarView.frame.origin.y)
        self.view.addConstraint(topMarginConstraint)
        UIView.animate(withDuration: 0.3, animations: {
            self.titleBarView.alpha = 0
            self.statusBarHidden = true
            self.setNeedsStatusBarAppearanceUpdate()
        }) { (completion: Bool) in
            self.view.removeConstraint(topMarginConstraint)
        }
    }
    
    func fadeInViews() {
        UIView.animate(withDuration: 0.3) {
            self.titleBarView.alpha = 1
            self.statusBarHidden = false
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}


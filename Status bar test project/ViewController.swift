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
        return UIStatusBarStyle.lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.fade
    }
    
    @IBAction func tappedBackground(sender: UITapGestureRecognizer) {
        if self.titleBarView.alpha == 0 {
            fadeInViews()
        } else {
            fadeOutViews()
        }
    }
 
    func fadeOutViews() {
        UIView.animate(withDuration: 0.3) {
            self.titleBarView.alpha = 0
            self.statusBarHidden = true
            self.setNeedsStatusBarAppearanceUpdate()
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


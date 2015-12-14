//
//  PullToSeprateViewController.swift
//  Bezier
//
//  Created by Allen on 12/13/15.
//  Copyright © 2015 wgl. All rights reserved.
//

import UIKit

class PullToSeprateViewController: UIViewController {
    
    var originView:UIView
    var secondView:UIView
    
    init() {
        originView = UIView()
        originView.backgroundColor = UIColor.grayColor()
        
        secondView = UIView()
        secondView.backgroundColor = UIColor.grayColor()
        
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        originView = UIView()
        originView.backgroundColor = UIColor.grayColor()
        
        secondView = UIView()
        secondView.backgroundColor = UIColor.grayColor()
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

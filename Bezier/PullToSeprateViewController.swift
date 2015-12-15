//
//  PullToSeprateViewController.swift
//  Bezier
//
//  Created by Allen on 12/13/15.
//  Copyright © 2015 wgl. All rights reserved.
//

import UIKit
import Masonry

class PullToSeprateViewController: UIViewController {
    
    var originView:UIView
    var secondView:UIView

    required init?(coder aDecoder: NSCoder) {
        originView = UIView(frame: CGRectMake(0,0,10,10))
        originView.backgroundColor = UIColor.grayColor()
        
        secondView = UIView(frame: CGRectMake(0,0,10,10))
        secondView.backgroundColor = UIColor.grayColor()
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func updateViewConstraints() {
        originView.mas_makeConstraints {
            [unowned self]
            (make:MASConstraintMaker!) -> Void in
            make.center.equalTo()(self.view)
            make.size.mas_equalTo()(CGSize(10,10))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

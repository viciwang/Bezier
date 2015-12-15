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
    let smallR:CGFloat = 10
    let bigR:CGFloat = 20
    var shapeLayer:CAShapeLayer

    required init?(coder aDecoder: NSCoder) {
        originView = UIView(frame: CGRectMake(0,0,smallR*2,smallR*2))
        originView.backgroundColor = UIColor.grayColor()
        
        secondView = UIView(frame: CGRectMake(0,0,bigR*2,bigR*2))
        secondView.backgroundColor = UIColor.grayColor()
        
        shapeLayer = CAShapeLayer()
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.center = self.view.center;
        let gesture = UIPanGestureRecognizer(target: self, action: "panAction:")
        secondView.addGestureRecognizer(gesture)
        shapeLayer.fillColor = UIColor.grayColor().CGColor
        shapeLayer.strokeColor = UIColor.grayColor().CGColor
        shapeLayer.lineWidth = 1.0
        
        originView.clipsToBounds = true
        originView.layer.cornerRadius = smallR
        secondView.clipsToBounds = true
        secondView.layer.cornerRadius = bigR
        
        view.addSubview(originView)
        view.addSubview(secondView)
        view.layer.addSublayer(shapeLayer)
    }
    
    override func updateViewConstraints() {
        originView.mas_makeConstraints {
            [unowned self]
            (make:MASConstraintMaker!) -> Void in
            make.center.equalTo()(self.view)
            make.size.equalTo()(NSValue(CGSize: CGSize(width: self.smallR*2,height: self.smallR*2)))
        }
        super.updateViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: gesture
    func panAction(gesture:UIPanGestureRecognizer) {
        let point = gesture.locationInView(view)
        secondView.center = point
        self.refresh()
    }
    
    func refresh() {
        let originCenter = originView.center
        let secondCenter = secondView.center
        let distance = self.distanceBetween(originCenter, secondCenter)
        let distanceX = secondCenter.x - originCenter.x
        let distanceY = secondCenter.y - originCenter.y
        let sin = distanceX/distance
        let cos = distanceY/distance
        let A = CGPointMake(originCenter.x+self.smallR*cos, originCenter.y-self.smallR*sin)
        let B = CGPointMake(originCenter.x-self.smallR*cos, originCenter.y+self.smallR*sin)
        
        let C = CGPointMake(secondCenter.x+self.bigR*cos, secondCenter.y-self.bigR*sin)
        let D = CGPointMake(secondCenter.x-self.bigR*cos, secondCenter.y+self.bigR*sin)
        
        let E = CGPointMake(A.x+distanceX*0.5, A.y+distanceY*0.5)
        let F = CGPointMake(B.x+distanceX*0.5, B.y+distanceY*0.5)
        
        let path = UIBezierPath()
        path.moveToPoint(A)
        path.addLineToPoint(B)
        path.addQuadCurveToPoint(D, controlPoint: F)
        path.addLineToPoint(C)
        path.addQuadCurveToPoint(A, controlPoint: E)
        path.closePath()
        shapeLayer.path = path.CGPath
        
        
    }
    
    func distanceBetween(a:CGPoint, _ b:CGPoint) ->CGFloat {
        return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y))
    }

}

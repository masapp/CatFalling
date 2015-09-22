//
//  GameViewController.swift
//  catFalling
//
//  Created by masapp on 9/8/15.
//  Copyright (c) 2015 masapp. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var cat: UIImageView!
    var position: CGPoint!
    var timer: NSTimer!
    var catArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let back: UIImageView = UIImageView(image: UIImage(named: "back.png"))
        back.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(back)
        
        let pad: UIImageView = UIImageView(image: UIImage(named: "pad.png"))
        pad.frame = CGRectMake(35, 500, 250, 50)
        self.view.addSubview(pad)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject()! as UITouch
        let location = touch.locationInView(self.view)
        
        NSLog("%@ %@", location.x, location.y)
        
        if (200 < location.y) {
            return
        }
        
        if (location.x < 35.5 || 252.5 < location.x) {
            return
        }
        
        if (timer != nil && timer.valid) {
            return
        }
        
        var rand = arc4random_uniform(4);
        NSLog("%d", rand)
        
        switch rand {
            case 0:
                put(location, name: "mike")
            case 1:
                put(location, name: "shiro")
            case 2:
                put(location, name: "tora")
            case 3:
                put(location, name: "kuro")
            default:
                break
        }
    }
    
    func put(location: CGPoint, name: NSString) {
        cat = UIImageView(image: UIImage(named: NSString(format: "%@.png", name)))
        cat.frame = CGRectMake(location.x, location.y, 30, 30)
        self.view.addSubview(cat)

        position = location
        timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: "falling:", userInfo: nil, repeats: true)
    }

    func falling(timer: NSTimer) {
        position.y = position.y + 0.5
        cat.frame = CGRectMake(position.x, position.y, 30, 30)
        
        if (500 < position.y) {
            timer.invalidate()
            catArray.addObject(cat)
            return
        }
        
        for (var i: Int = 0; i < catArray.count; i++) {
            if (CGRectIntersectsRect(cat.frame, catArray.objectAtIndex(i).frame)) {
                timer.invalidate()
                catArray.addObject(cat)
                return
            }
        }
    }
}

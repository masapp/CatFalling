//
//  TileViewController.swift
//  catFalling
//
//  Created by masapp on 9/8/15.
//  Copyright (c) 2015 masapp. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog("title view controller")
        
        let back: UIImageView = UIImageView(image: UIImage(named: "back.png"))
        back.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(back)
        
        let titleLabel: UILabel = UILabel(frame: CGRectMake(0, 150, UIScreen.mainScreen().bounds.width, 60))
        titleLabel.text = "Title"
        titleLabel.font = UIFont(name: "Helvetica", size: 50)
        titleLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLabel)
        
        let start: UIButton = UIButton(frame: CGRectMake(65, 300, 200, 50))
        start.setTitle("start", forState: .Normal)
        start.setTitleColor(UIColor.blackColor(), forState: .Normal)
        start.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
        start.titleLabel?.textAlignment = NSTextAlignment.Center
        start.addTarget(self, action: "startGame:", forControlEvents: .TouchUpInside)
        self.view.addSubview(start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startGame(sender: UIButton) {
        let gameViewController: UIViewController = GameViewController()
        self.presentViewController(gameViewController, animated: false, completion: nil)
    }
}


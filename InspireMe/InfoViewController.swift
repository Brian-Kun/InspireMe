//
//  InfoViewController.swift
//  InspireMe
//
//  Created by Brian Ramirez on 7/6/15.
//  Copyright (c) 2015 Brian Ramirez. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes the image round
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.clipsToBounds = true
        
        // Give the image a border 
        self.profileImage.layer.borderWidth = 3.0
        self.profileImage.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).CGColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

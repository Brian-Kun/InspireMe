//
//  ViewController.swift
//  InspireMe
//
//  Created by Brian Ramirez on 6/26/15.
//  Copyright (c) 2015 Brian Ramirez. All rights reserved.
//

import UIKit        // UI: user interface
import Social

class ViewController: UIViewController {
    
    // IB: Interface Builder
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var quotes = Quotes()
    
    
    // gets called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up local notifications
        // A new qoute will be sent everymorning at 9:50AM
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2015;
        dateComp.month = 07;
        dateComp.day = 22;
        dateComp.hour = 09; // 24hour clock
        dateComp.minute = 58;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        var calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        var date:NSDate = calender.dateFromComponents(dateComp)!
        
        var notification:UILocalNotification = UILocalNotification()
        notification.alertBody = getQuote()
        notification.fireDate = date
        notification.repeatInterval = NSCalendarUnit.CalendarUnitDay
            
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        //End local notifications
        
        
        getQuote()
        getbackgroundImage()
        
    }
    
    // Interface Builder Action.
    // Gets called whenever the user taps on the button
    @IBAction func inspireMeDidTap(sender: UIButton)
        
    {
        
        getQuote()
        getbackgroundImage()
        
    }
    
    
    func getQuote() -> String{
        
        var quote = quotes.randomQuote()
        quoteLabel.text = quote
        
        return quote
    }
    
    
    
    
    
    func getbackgroundImage() {
        
        let image = randomImage()
        backgroundImageView.image = image
        

    }
  
    
    func randomImage() -> UIImage{
        
        let imageCount = 36
        let randomNumber = Int(arc4random_uniform(UInt32(imageCount)))
        println(randomNumber)
        
        if let image = UIImage(named: "image\(randomNumber)"){
            return image
        }
        else{
            return UIImage(named: "image1")!
        }
        
        
    }
    
    
    @IBAction func ShareOnTwitterButtonPressed(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            var twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText(quoteLabel.text)
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    

    
    
}


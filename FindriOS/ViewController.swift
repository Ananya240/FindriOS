//
//  ViewController.swift
//  FindriOS
//
//  Created by Ananya Gupta on 7/13/17.
//  Copyright (c) 2017 Ananya Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
//        let placesArray = ["abc" :123, "22" :123, "zee": 234]
//        let placesData = NSKeyedArchiver.archivedDataWithRootObject(placesArray)
//        NSUserDefaults.standardUserDefaults().setObject(placesArray, forKey: "places")
//        //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation())
//        let arr = NSUserDefaults.standardUserDefaults().objectForKey("places")
//        print(arr)
        let arr = NSUserDefaults.standardUserDefaults().objectForKey("foundPlaces")
        print(arr)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let loggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isLoggedIn");
        if (!loggedIn) {
            self.performSegueWithIdentifier("viewLogin", sender: self);
        }
    }

    @IBAction func onClickLogout(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("viewLogin") as! ViewControllerLogIn;
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController=loginViewController
        
        appDelegate.window?.makeKeyAndVisible()
        
        //self.performSegueWithIdentifier("viewLogin", sender: self);
    }

}


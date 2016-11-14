//
//  ViewController.swift
//  ios-interview
//
//  Copyright © 2016 Headspace. All rights reserved.
//

import UIKit

// global ID for user, normally would store it in a better place
let user = "HSUSER_234234"

class ViewController: UIViewController {
    // initialize variable to shorten calls to analytics
    let analytics = Analytics.sharedInstance
    
    ///// CONSTANTS /////
    let session = "HSSESSION_123111"
    let LOGIN_EVENT = "login"
    let MEDIT_EVENT = "completed"
    
    // MARK: Actions

    @IBAction func login(_ sender: UIButton) {
        analytics.loginService.sendEvent(event: LOGIN_EVENT)
    }

    @IBAction func completeMeditation(_ sender: UIButton) {
        analytics.meditationService.sendEvent(event: MEDIT_EVENT, data: ["sessionID": session])
    }
}

//
//  ViewController.swift
//  ios-interview
//
//  Copyright © 2016 Headspace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // initialize variable to shorten calls to analytics
    let analyticsService = Analytics.sharedInstance
    let user = "HSUSER_234234"
    let session = "HSSESSION_123111"
    
    // MARK: Actions

    @IBAction func login(_ sender: UIButton) {
        analyticsService.loginService.sendEvent(user: user, data: ["buttonColor": "blue"])
    }

    @IBAction func completeMeditation(_ sender: UIButton) {
        analyticsService.completedMeditationService.sendEvent(user: user, data: ["sessionID": session])
    }
}

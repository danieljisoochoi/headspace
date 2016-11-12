//
//  ViewController.swift
//  ios-interview
//
//  Copyright © 2016 Headspace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Actions

    @IBAction func login(_ sender: UIButton) {
        // Send login event to Google Analytics and Snowplow.
        GoogleAnalyticsSDK.sharedInstance.sendEvent("login", forUser: "HSUSER_234234", withData: [
            "buttonColor": "blue"
        ])
        SnowplowSDK.sharedInstance.dispatchEvent("log_in", withPayload: [
            "userID": "HSUSER_234234"
        ])
    }

    @IBAction func completeMeditation(_ sender: UIButton) {
        // Send meditation completion event to Google Analytics
        GoogleAnalyticsSDK.sharedInstance.sendEvent("completeMeditation", forUser: "HSUSER_234234", withData: [
            "sessionID": "HSSESSION_123111"
        ])
    }
}

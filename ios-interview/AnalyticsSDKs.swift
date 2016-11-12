//
//  AnalyticsSDKs.swift
//  ios-interview
// 
//  Copyright © 2016 Headspace. All rights reserved.
//
//  NOTE: DO NOT CHANGE THESE SDK METHODS.
//  Pretend they are exposed via a cocoapod.
//

import Foundation

final class GoogleAnalyticsSDK {
    static let sharedInstance = GoogleAnalyticsSDK()

    func sendEvent(_ identifier: String, forUser userID: String, withData data: [String: String]) {
        print("GoogleAnalytics.sendEvent(\(identifier), forUser: \(userID), withData: \(data))")
    }
}

final class SnowplowSDK {
    static let sharedInstance = SnowplowSDK()

    func dispatchEvent(_ eventID: String, withPayload payload: [String: Any]) {
        print("SnowplowSDK.dispatchEvent(\(eventID), withPayload: \(payload))")
    }
}

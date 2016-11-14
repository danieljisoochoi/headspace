//
//  MeditationService.swift
//  ios-interview
//
//  Created by Daniel Jisoo Choi on 11/14/16.
//  Copyright © 2016 Headspace. All rights reserved.
//

import Foundation

protocol MeditationService: AnalyticsService {
    func completedMeditation(data: [String:String]?)
}

class MeditationServiceImpl: MeditationService {
    // default data to analyze
    var analyticsData = [
        "durationInMinutes" : "10",
        "location" : "bedroom"
    ]
    
    func sendEvent(event: String, data: [String : String]? = nil) {
        // combine constant data for analysis with dynamic data
        analyticsData.concatenate(with: data)
        switch event {
        case "started":
            break
        case "completed":
            completedMeditation(data: analyticsData)
        default:
            break
        }
    }
    internal func completedMeditation(data: [String : String]? = nil) {
        // Send meditation completion event to Google Analytics
        GoogleAnalyticsSDK.sharedInstance.sendEvent("completeMeditation", forUser: user, withData: data ?? [:])
    }
}

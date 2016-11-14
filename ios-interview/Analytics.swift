//
//  Analytics.swift
//  ios-interview
//
//  Created by Daniel Jisoo Choi on 11/12/16.
//  Copyright © 2016 Headspace. All rights reserved.
//

import Foundation

class Analytics {
    static let sharedInstance = Analytics()
    
    private init() {}
    
    let loginService = LoginServiceImpl()
    let meditationService = MeditationServiceImpl()
}

// all services that are part of Analytics conform to this protocol
protocol AnalyticsService {
    var analyticsData: [String: String] { get set }
    // given an event string, sends the data associated with the event to the corresponding SDK
    func sendEvent(event: String, data: [String:String]?)
}

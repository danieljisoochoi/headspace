//
//  ios_interviewTests.swift
//  ios-interviewTests
//
//  Copyright © 2016 Headspace. All rights reserved.
//

import XCTest
@testable import ios_interview

class ios_interviewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginAnalytics() {
        // given
        let loginServiceFake1 = LoginServiceImpl()
        loginServiceFake1.analyticsData = [
            "deviceID" : "a098dfad0"
        ]
        let loginServiceFake2 = LoginServiceImpl()
        loginServiceFake2.analyticsData = [
            "deviceID" : "2342"
        ]

        // when
        loginServiceFake1.sendEvent(event: "login")
        loginServiceFake2.sendEvent(event: "login", data: ["time" : "5:23PM"])
        
        // then
        XCTAssertEqual(loginServiceFake1.analyticsData, ["deviceID" : "a098dfad0"])
        XCTAssertEqual(loginServiceFake2.analyticsData, ["deviceID" : "2342", "time" : "5:23PM"])
    }
    
    func testMeditationCompleteAnalytics() {
        // given
        let meditServiceFake1 = MeditationServiceImpl()
        meditServiceFake1.analyticsData = [:]
        let meditServiceFake2 = MeditationServiceImpl()
        meditServiceFake2.analyticsData = [
            "deviceID" : "someid",
            "isMorning" : "true"
        ]
        
        // when
        meditServiceFake1.sendEvent(event: "started")
        meditServiceFake2.sendEvent(event: "completed", data: ["durationInDays" : "1"])
        
        // then
        XCTAssertEqual(meditServiceFake1.analyticsData, [:])
        XCTAssertEqual(meditServiceFake2.analyticsData.count, 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

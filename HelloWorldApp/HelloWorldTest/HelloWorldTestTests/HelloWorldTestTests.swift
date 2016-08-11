//
//  HelloWorldTestTests.swift
//  HelloWorldTestTests
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import XCTest
@testable import HelloWorldTest

class HelloWorldTestTests: XCTestCase {
    //shared properties initialized in setUp are declared as optional vars in Swift.
    //This is because XCTestCase is not intended to be initialized directly from within a test case definition
    var socketConnection: SocketConnection?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        socketConnection = SocketConnection()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testmatchesForRegexInTextFunction() {
        //Set up
         let regex: String = "http://(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}:([0-9]{4}/)"
         let invalidString = "http://192.168.2.4:8060/s`dvaknsf dv `adf s`f bl/adf"
         let expectedResult = "http://192.168.2.4:8060/"
        
        //test
         let actualResult = socketConnection!.matchesForRegexInText(regex, text: invalidString)
        
        //Assert
        XCTAssertEqual(actualResult.first, expectedResult)
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

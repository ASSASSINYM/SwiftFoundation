//
//  RegularExpressionTests.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/11/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import XCTest
import SwiftFoundation

class RegularExpressionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSimpleRegex() {
        
        let regex = try! RegularExpression("Welcome")
        
        let string = "Welcome to RegExr v2.0 by gskinner.com!"
        
        guard let match = regex.match(string, options: [])
            else { XCTFail("Could not find match"); return }
        
        let stringRange = NSRange(match.range)
        
        let matchString = (string as NSString).substringWithRange(stringRange)
        
        XCTAssert(matchString == "Welcome")
    }
    
    func testExtendedRegex() {
        
        do {
            
            let regex = try! RegularExpression("a{3}", options: [.ExtendedSyntax])
            
            let string = "lorem ipsum aaa"
            
            guard let match = regex.match(string, options: [])
                else { XCTFail("Could not find match"); return }
            
            let stringRange = NSRange(match.range)
            
            let matchString = (string as NSString).substringWithRange(stringRange)
            
            XCTAssert(matchString == "aaa")
        }
        
        do {
            
            // match 5 letter word
            let regex = try! RegularExpression("[a-z, A-Z]{4}", options: [.ExtendedSyntax])
            
            let string = "Bird, Plane, Coleman"
            
            guard let match = regex.match(string, options: [])
                else { XCTFail("Could not find match"); return }
            
            let stringRange = NSRange(match.range)
            
            let matchString = (string as NSString).substringWithRange(stringRange)
            
            XCTAssert(matchString == "Bird", matchString)
        }
    }
    
    func testMultipleSubexpressions() {
        
        let string = "/abc/xyz"
        
        let regex = try! RegularExpression("/([a-z]+)/([a-z]+)", options: [.ExtendedSyntax])
        
        guard let match = regex.match(string, options: [])
            else { XCTFail("Could not find match"); return }
        
        let stringRange = NSRange(match.range)
        
        let matchString = (string as NSString).substringWithRange(stringRange)
        
        // matched whole string
        XCTAssert(matchString == string)
        
        // match subexpressions
        
        XCTAssert(match.subexpressionRanges.count == regex.subexpressionsCount, "Subexpressions should be \(regex.subexpressionsCount), is \(match.subexpressionRanges.count)")
    }
}



//
//  UUIDTests.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/2/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import XCTest
import SwiftFoundation
import SwiftFoundation

final class UUIDTests: XCTestCase {
    
    lazy var allTests: [(String, () -> ())] =
        [("testCreateRandomUUID", self.testCreateRandomUUID),
        ("testUUIDString", self.testUUIDString),
        ("testCreateFromString", self.testCreateFromString)]
    
    // MARK: - Functional Tests

    func testCreateRandomUUID() {
        
        // try to create without crashing
        let uuid = UUID()
        
        print(uuid)
    }
    
    func testUUIDString() {
        
        let stringValue = "5bfeb194-68c4-48e8-8f43-3c586364cb6f".uppercaseString
        
        guard let uuid = UUID(rawValue: stringValue)
            else { XCTFail("Could not create UUID from " + stringValue); return }
        
        XCTAssert(uuid.rawValue == stringValue, "UUID is \(uuid), should be \(stringValue)")
    }
    
    func testCreateFromString() {
        
        let stringValue = "5bfeb194-68c4-48e8-8f43-3c586364cb6f".uppercaseString
        
        XCTAssert((UUID(rawValue: stringValue) != nil), "Could not create UUID with string \"\(stringValue)\"")
        
        XCTAssert((UUID(rawValue: "BadInput") == nil), "UUID should not be created")
    }
}

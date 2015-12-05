//
//  SortDescriptorTests.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 7/3/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import XCTest
import SwiftFoundation

class SortDescriptorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Functional Tests

    func testComparableSorting() {
        
        func verifySort(items: [String], ascending: Bool = true) {
            
            let sortedItems = Sort(items, sortDescriptor: ComparableSortDescriptor(ascending: ascending))
            
            let foundationSortedItems = (items as NSArray).sortedArrayUsingDescriptors([NSSortDescriptor(key: nil, ascending: ascending)])
            
            for (index, element) in sortedItems.enumerate() {
                
                let foundationElement = foundationSortedItems[index]
                
                if foundationElement as! String != element {
                    
                    XCTFail("Elements to not match Swift: \(sortedItems) Foundation: \(foundationSortedItems)\n")
                    
                    return
                }
            }
        }
        
        let names = ["coleman", "Coleman", "alsey", "miller", "Z", "A"]
        
        verifySort(names)
        
        verifySort(names, ascending: false)
        
        let places = ["Lima, Peru", "Brazil", "Florida", "San Diego", "Hong Kong"]
        
        verifySort(places)
        
        verifySort(places, ascending: false)
    }
    
    func testComparatorSorting() {
        
        func verifySort(items: [String], ascending: Bool = true) {
            
            let sortedItems = Sort(items, sortDescriptor: ComparatorSortDescriptor(ascending: ascending, comparator: { (first: String, second: String) -> Order in
                
                return first.compare(second)
            }))
            
            let foundationSortedItems = (items as NSArray).sortedArrayUsingDescriptors([NSSortDescriptor(key: nil, ascending: ascending)])
            
            for (index, element) in sortedItems.enumerate() {
                
                let foundationElement = foundationSortedItems[index]
                
                if foundationElement as! String != element {
                    
                    XCTFail("Elements to not match\nSwift:\n\(sortedItems)\nFoundation:\n\(foundationSortedItems)\n")
                    
                    return
                }
            }
        }
        
        let names = ["coleman", "Coleman", "alsey", "miller", "Z", "A"]
        
        verifySort(names)
        
        verifySort(names, ascending: false)
        
        let places = ["Lima, Peru", "Brazil", "Florida", "San Diego", "Hong Kong"]
        
        verifySort(places)
        
        verifySort(places, ascending: false)
    }
}

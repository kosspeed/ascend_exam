//
//  DoubleExtensionsTests.swift
//  ProductExamTests
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

@testable import ProductExam
import XCTest

class DoubleExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func test_roundedUp2Digit() {
        let double = 1.767
        let rounded = double.rounded(toPlaces: 2)
        let expectedResult = 1.77
        
        XCTAssert(rounded == expectedResult)
    }
    
    func test_roundedDown2Digit() {
        let double = 1.763
        let rounded = double.rounded(toPlaces: 2)
        let expectedResult = 1.76
        
        XCTAssert(rounded == expectedResult)
    }
}

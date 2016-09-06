//
//  ShapeSearchTests.swift
//  ShapeSearchTests
//
//  Created by Lou Franco on 9/5/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//

import XCTest
@testable import ShapeSearch

class ShapeSearchTests: XCTestCase {
    
    func testHasAttribute() {
        XCTAssert(hasAttribute(shape: Shapes[5], attribute: .IsGray))
        XCTAssertFalse(hasAttribute(shape: Shapes[5], attribute: .IsSolid))
    }

    func testBestQuestionForShapes() {
        let a = bestAttributeToAsk(forShapes: Shapes)
        XCTAssert(a == .IsSolid || a == .IsPatterned)
    }

    func testBestQuestionForSolidShapes() {
        let shapes = Shapes.filter { $0.attributes.contains(.IsSolid) }
        let a = bestAttributeToAsk(forShapes: shapes)
        XCTAssert(a == .HasBorder)
    }

    func testContents0102() {
        XCTAssert(Contents0102())
    }

    func testContents0103() {
        XCTAssert(Contents0103() == .IsSolid)
    }

    func testContents0104() {
        let shapes = Contents0104()
        XCTAssert(shapes.count == 8)
        for s in shapes {
            XCTAssert(!s.attributes.contains(.IsSolid))
        }
    }
    
}

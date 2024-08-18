//: [Previous](@previous)

import UIKit
import Combine
import XCTest

class HelloCombineTests: XCTestCase {

    func testFirstTest() {

        let expectation = XCTestExpectation(description: "Received value")

        let publisher = Just("Hello World!")

        let _ = publisher.sink { value in
            XCTAssertEqual(value, "Hello World!")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)

    }
}

HelloCombineTests.defaultTestSuite.run()

//
//  DecimalCalculatorTests.swift
//  CalculatorTests
//
//  Created by Wonhee on 2020/12/14.
//

import XCTest
@testable import Calculator

final class DecimalCalculatorTests: XCTestCase {
    
    private var decimalCalculator: DecimalCalculator!
    
    override func setUp() {
        super.setUp()
        decimalCalculator = DecimalCalculator()
    }

    override func tearDown() {
        decimalCalculator = nil
        super.tearDown()
    }
    
    // MARK: add func test code
    func testAdd() throws {
        let result = try decimalCalculator.add(first: "2", second: "3")
        XCTAssertEqual(result, "5.0")
    }
    func testAddWithDouble() throws {
        let result = try decimalCalculator.add(first: "2.5", second: "3")
        XCTAssertEqual(result, "5.5")
    }
    func testAddWithNegative() throws {
        let result = try decimalCalculator.add(first: "-7.6", second: "2")
        XCTAssertEqual(result, "-5.6")
    }
    
    // MARK: subtract func test code
    func testSubtract() throws {
        let result = try decimalCalculator.subtract(first: "6", second: "3")
        XCTAssertEqual(result, "3.0")
    }
    func testSubtractWithDouble() throws {
        let result = try decimalCalculator.subtract(first: "2.6", second: "2.5")
        XCTAssertEqual(result, "0.1")
    }
    func testSubtractWithNegative() throws {
        let result = try decimalCalculator.subtract(first: "2.0", second: "-2.5")
        XCTAssertEqual(result, "4.5")
    }
    func testSubtractWithDoubleNegative() throws {
        let result = try decimalCalculator.subtract(first: "-4.5", second: "-4")
        XCTAssertEqual(result, "-0.5")
    }
    
    // MARK: multiply func test code
    func testMultiply() throws {
        let result = try decimalCalculator.multiply(first: "2", second: "4")
        XCTAssertEqual(result, "8.0")
    }
    func testMultiplyWithDouble() throws {
        let result = try decimalCalculator.multiply(first: "2.0", second: "4.35")
        XCTAssertEqual(result, "8.7")
    }
    func testMultiplyWithNegative() throws {
        let result = try decimalCalculator.multiply(first: "4.2", second: "-2")
        XCTAssertEqual(result, "-8.4")
    }
    func testMultipleWithDoubleNegative() throws {
        let result = try decimalCalculator.multiply(first: "-3.0", second: "-2.0")
        XCTAssertEqual(result, "6.0")
    }
    
    // MARK: divide func test code
    func testDivide() throws {
        let result = try decimalCalculator.divide(first: "5.0", second: "2")
        XCTAssertEqual(result, "2.5")
    }
    func testDivideWithError() throws {
        XCTAssertThrowsError(try decimalCalculator.divide(first: "4", second: "0"))
    }
    func testDivideWithDouble() throws {
        let result = try decimalCalculator.divide(first: "4.3", second: "2")
        XCTAssertEqual(result, "2.15")
    }
    func testDivideWithNegative() throws {
        let result = try decimalCalculator.divide(first: "5.4", second: "-2")
        XCTAssertEqual(result, "-2.7")
    }
    func testDivideWithDoubleNegative() throws {
        let result = try decimalCalculator.divide(first: "-2.87", second: "-0.2")
        XCTAssertEqual(result, "14.35")
    }
    
    // MARK: calculate func test code
    func testCalculate() throws {
        let result = try decimalCalculator.calculate(["3", "+", "-2", "*", "4", "+", "2", "-", "3", "/", "4", "-", "-5"])
        XCTAssertEqual(result, "1.25")
    }
    
    func testRemoveAll() throws {
        decimalCalculator.clear()
        XCTAssertTrue(decimalCalculator.postfixStack.isEmpty && decimalCalculator.calculateStack.isEmpty)
    }
}
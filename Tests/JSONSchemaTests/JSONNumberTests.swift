
import XCTest
import JSONSchema

final class JSONNumberTests: XCTestCase {

    func test_create_noValues() throws {
        let integer = JSONNumber()
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_multipleOf() throws {
        let integer = JSONNumber(multipleOf: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"multipleOf":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_minimum() throws {
        let integer = JSONNumber(minimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"minimum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_exclusiveMinimum() throws {
        let integer = JSONNumber(exclusiveMinimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMinimum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_maximum() throws {
        let integer = JSONNumber(maximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"maximum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_exclusiveMaximum() throws {
        let integer = JSONNumber(exclusiveMaximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMaximum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }
}
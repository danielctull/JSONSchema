
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
            {"type":"number","multipleOf":2}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_minimum() throws {
        let integer = JSONNumber(minimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"number","minimum":2}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_exclusiveMinimum() throws {
        let integer = JSONNumber(exclusiveMinimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"number","exclusiveMinimum":2}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_maximum() throws {
        let integer = JSONNumber(maximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"number","maximum":2}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_exclusiveMaximum() throws {
        let integer = JSONNumber(exclusiveMaximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"number","exclusiveMaximum":2}
            """)
        XCTAssertEqual(json, expected)
    }
}

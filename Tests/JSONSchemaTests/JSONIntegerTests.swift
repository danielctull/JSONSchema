
import XCTest
import JSONSchema

final class JSONIntegerTests: XCTestCase {

    func test_create_noValues() throws {
        let integer = JSONInteger()
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_multipleOf() throws {
        let integer = JSONInteger(multipleOf: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"multipleOf":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_minimum() throws {
        let integer = JSONInteger(minimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"minimum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_exclusiveMinimum() throws {
        let integer = JSONInteger(exclusiveMinimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMinimum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_maximum() throws {
        let integer = JSONInteger(maximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"maximum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_exclusiveMaximum() throws {
        let integer = JSONInteger(exclusiveMaximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMaximum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }
}


import XCTest
import JSONSchema

final class NumberTests: XCTestCase {

    func test_decode_noValues() throws {
        let json = try JSON("""
            {"type":"number"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .number(JSONNumber()))
    }

    func test_encode_noValues() throws {
        let integer = JSONNumber()
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_multipleOf() throws {
        let json = try JSON("""
            {"multipleOf":2,"type":"number"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .number(JSONNumber(multipleOf: 2)))
    }

    func test_encode_multipleOf() throws {
        let integer = JSONNumber(multipleOf: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"multipleOf":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_minimum() throws {
        let json = try JSON("""
            {"minimum":2,"type":"number"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .number(JSONNumber(minimum: 2)))
    }

    func test_encode_minimum() throws {
        let integer = JSONNumber(minimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"minimum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_exclusiveMinimum() throws {
        let json = try JSON("""
            {"exclusiveMinimum":2,"type":"number"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .number(JSONNumber(exclusiveMinimum: 2)))
    }

    func test_encode_exclusiveMinimum() throws {
        let integer = JSONNumber(exclusiveMinimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMinimum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_maximum() throws {
        let json = try JSON("""
            {"maximum":2,"type":"number"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .number(JSONNumber(maximum: 2)))
    }

    func test_encode_maximum() throws {
        let integer = JSONNumber(maximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"maximum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_exclusiveMaximum() throws {
        let json = try JSON("""
            {"exclusiveMaximum":2,"type":"number"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .number(JSONNumber(exclusiveMaximum: 2)))
    }

    func test_encode_exclusiveMaximum() throws {
        let integer = JSONNumber(exclusiveMaximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMaximum":2,"type":"number"}
            """)
        XCTAssertEqual(json, expected)
    }
}

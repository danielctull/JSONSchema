
import XCTest
import JSONSchema

final class JSONIntegerTests: XCTestCase {

    func test_decode_noValues() throws {
        let json = try JSON("""
            {"type":"integer"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .integer(JSONInteger()))
    }

    func test_encode_noValues() throws {
        let integer = JSONInteger()
        let json = try JSON(integer)
        let expected = try JSON("""
            {"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_multipleOf() throws {
        let json = try JSON("""
            {"multipleOf":2,"type":"integer"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .integer(JSONInteger(multipleOf: 2)))
    }

    func test_encode_multipleOf() throws {
        let integer = JSONInteger(multipleOf: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"multipleOf":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_minimum() throws {
        let json = try JSON("""
            {"minimum":2,"type":"integer"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .integer(JSONInteger(minimum: 2)))
    }

    func test_encode_minimum() throws {
        let integer = JSONInteger(minimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"minimum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_exclusiveMinimum() throws {
        let json = try JSON("""
            {"exclusiveMinimum":2,"type":"integer"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .integer(JSONInteger(exclusiveMinimum: 2)))
    }

    func test_encode_exclusiveMinimum() throws {
        let integer = JSONInteger(exclusiveMinimum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMinimum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_maximum() throws {
        let json = try JSON("""
            {"maximum":2,"type":"integer"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .integer(JSONInteger(maximum: 2)))
    }

    func test_encode_maximum() throws {
        let integer = JSONInteger(maximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"maximum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_exclusiveMaximum() throws {
        let json = try JSON("""
            {"exclusiveMaximum":2,"type":"integer"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .integer(JSONInteger(exclusiveMaximum: 2)))
    }

    func test_encode_exclusiveMaximum() throws {
        let integer = JSONInteger(exclusiveMaximum: 2)
        let json = try JSON(integer)
        let expected = try JSON("""
            {"exclusiveMaximum":2,"type":"integer"}
            """)
        XCTAssertEqual(json, expected)
    }
}

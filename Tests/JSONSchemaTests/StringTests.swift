
import JSONSchema
import XCTest

final class StringTests: XCTestCase {

    func test_decode_noValues() throws {
        let json = try JSON("""
            {"type":"string"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .string(JSONString()))
    }

    func test_encode_noValues() throws {
        let string = JSONString()
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_minimumLength() throws {
        let json = try JSON("""
            {"minLength":3,"type":"string"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .string(JSONString(minimumLength: 3)))
    }

    func test_encode_minimumLength() throws {
        let string = JSONString(minimumLength: 3)
        let json = try JSON(string)
        let expected = try JSON("""
            {"minLength":3,"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_maximumLength() throws {
        let json = try JSON("""
            {"maxLength":4,"type":"string"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .string(JSONString(maximumLength: 4)))
    }

    func test_encode_maximumLength() throws {
        let string = JSONString(maximumLength: 4)
        let json = try JSON(string)
        let expected = try JSON("""
            {"maxLength":4,"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_pattern() throws {
        let json = try JSON("""
            {"pattern":"PATTERN","type":"string"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .string(JSONString(pattern: "PATTERN")))
    }

    func test_encode_pattern() throws {
        let string = JSONString(pattern: "PATTERN")
        let json = try JSON(string)
        let expected = try JSON("""
            {"pattern":"PATTERN","type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_decode_allValues() throws {
        let json = try JSON("""
            {"maxLength":4,"minLength":3,"type":"string","pattern":"PATTERN"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .string(JSONString(minimumLength: 3, maximumLength: 4, pattern: "PATTERN")))
    }

    func test_encode_allValues() throws {
        let string = JSONString(minimumLength: 3, maximumLength: 4)
        let json = try JSON(string)
        let expected = try JSON("""
            {"maxLength":4,"minLength":3,"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }
}

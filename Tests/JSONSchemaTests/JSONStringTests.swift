
import XCTest
import JSONSchema

final class JSONStringTests: XCTestCase {

    func test_encode_noValues() throws {
        let string = JSONString()
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_encode_minimumLength() throws {
        let string = JSONString(minimumLength: 3)
        let json = try JSON(string)
        let expected = try JSON("""
            {"minLength":3,"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_encode_maximumLength() throws {
        let string = JSONString(maximumLength: 4)
        let json = try JSON(string)
        let expected = try JSON("""
            {"maxLength":4,"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_encode_pattern() throws {
        let string = JSONString(pattern: "PATTERN")
        let json = try JSON(string)
        let expected = try JSON("""
            {"pattern":"PATTERN","type":"string"}
            """)
        XCTAssertEqual(json, expected)
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

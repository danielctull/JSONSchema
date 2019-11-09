
import XCTest
import JSONSchema

final class JSONStringTests: XCTestCase {

    func test_create_noValues() throws {
        let string = JSONString()
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"string"}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_minimumLength() throws {
        let string = JSONString(minimumLength: 3)
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"string","minLength":3}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_maximumLength() throws {
        let string = JSONString(maximumLength: 4)
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"string","maxLength":4}
            """)
        XCTAssertEqual(json, expected)
    }

    func test_create_allValues() throws {
        let string = JSONString(minimumLength: 3, maximumLength: 4)
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"string","maxLength":4,"minLength":3}
            """)
        XCTAssertEqual(json, expected)
    }
}

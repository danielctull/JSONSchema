
import JSONSchema
import XCTest

final class NullTests: XCTestCase {

    func test_decode() throws {
        let json = try JSON("""
            {"type":"null"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .null)
    }

    func test_encode() throws {
        let string = JSONType.null
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"null"}
            """)
        XCTAssertEqual(json, expected)
    }
}

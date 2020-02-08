
import JSONSchema
import XCTest

final class BooleanTests: XCTestCase {

    func test_decode() throws {
        let json = try JSON("""
            {"type":"boolean"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .boolean)
    }


    func test_encode() throws {
        let string = JSONType.boolean
        let json = try JSON(string)
        let expected = try JSON("""
            {"type":"boolean"}
            """)
        XCTAssertEqual(json, expected)
    }
}

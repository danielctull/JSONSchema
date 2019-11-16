
import XCTest
import JSONSchema

final class ArrayTests: XCTestCase {

    func test_decode_noValues() throws {
        let json = try JSON("""
            {"type":"array"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray()))
    }

    func test_decode_listValidation() throws {
        let json = try JSON("""
            {"type": "array", "items": { "type": "string" }}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray(itemValidation: .list(.string(JSONString())))))
    }
}

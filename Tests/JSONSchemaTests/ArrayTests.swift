
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
}

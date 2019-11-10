
import XCTest
import JSONSchema

final class JSONObjectTests: XCTestCase {

    func test_decode_() throws {
        let json = try JSON("""
            {
                "type": "object",
                "properties": {
                    "name": { "type": "string" },
                }
            }
            """)
        let object = try JSONObject(json)
        let properties = try XCTUnwrap(object.properties)
        XCTAssertEqual(properties.count, 1)
        let name = try XCTUnwrap(properties.first)
        XCTAssertEqual(name.name, "name")
        XCTAssertEqual(name.type, .string(JSONString()))
        XCTAssertEqual(name.required, false)
    }
}

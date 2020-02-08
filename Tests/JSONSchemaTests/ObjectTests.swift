
import JSONSchema
import XCTest

final class ObjectTests: XCTestCase {

    func test_decode_noValues() throws {
        let json = try JSON("""
            {"type":"object"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .object(JSONObject()))
    }

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
        let properties = try Unwrap(object.properties)
        XCTAssertEqual(properties.count, 1)
        let name = try Unwrap(properties.first)
        XCTAssertEqual(name.name, "name")
        XCTAssertEqual(name.type, .string(JSONString()))
        XCTAssertFalse(name.required)
    }

    func test_decode_required() throws {
        let json = try JSON("""
            {
                "type": "object",
                "properties": {
                    "name": { "type": "string" },
                },
                "required": ["name"]
            }
            """)
        let object = try JSONObject(json)
        let properties = try Unwrap(object.properties)
        XCTAssertEqual(properties.count, 1)
        let name = try Unwrap(properties.first)
        XCTAssertEqual(name.name, "name")
        XCTAssertEqual(name.type, .string(JSONString()))
        XCTAssertTrue(name.required)
    }
}

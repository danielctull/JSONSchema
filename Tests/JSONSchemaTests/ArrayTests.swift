
import JSONSchema
import XCTest

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

    func test_decode_minimumItems() throws {
        let json = try JSON("""
            {"minItems":40,"type":"array"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray(minimumItems: 40)))
    }

    func test_decode_maximumItems() throws {
        let json = try JSON("""
            {"maxItems":100,"type":"array"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray(maximumItems: 100)))
    }

    func test_decode_uniqueItems_notPresent() throws {
        let json = try JSON("""
            {"type":"array"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray(uniqueItems: false)))
    }

    func test_decode_uniqueItems_true() throws {
        let json = try JSON("""
            {"uniqueItems":true,"type":"array"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray(uniqueItems: true)))
    }

    func test_decode_uniqueItems_false() throws {
        let json = try JSON("""
            {"uniqueItems":false,"type":"array"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .array(JSONArray(uniqueItems: false)))
    }
}

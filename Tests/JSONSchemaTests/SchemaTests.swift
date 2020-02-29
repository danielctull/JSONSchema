
import JSONSchema
import XCTest

final class SchemaTests: XCTestCase {

    func testHasSchema() throws {
        let json = try JSON("""
            { "$schema": "http://json-schema.org/schema#" }
            """)
        let schema = try Schema(json)
        XCTAssertEqual(schema.schema, "http://json-schema.org/schema#")
    }

    func testNoSchema() throws {
        let json = try JSON("""
            {}
            """)
        let schema = try Schema(json)
        XCTAssertNil(schema.schema)
    }
}

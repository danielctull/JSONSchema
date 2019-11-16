
import XCTest
import JSONSchema

final class SchemaTests: XCTestCase {

    func testHasSchema() throws {
        let json = try JSON("""
            { "$schema": "http://json-schema.org/schema#" }
            """)
        let schema = try JSONSchema(json)
        XCTAssertEqual(schema.schema, "http://json-schema.org/schema#")
    }

    func testNoSchema() throws {
        let json = try JSON("""
            {}
            """)
        let schema = try JSONSchema(json)
        XCTAssertNil(schema.schema)
    }
}

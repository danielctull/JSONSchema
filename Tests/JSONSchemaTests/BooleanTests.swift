
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
}

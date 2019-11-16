
import XCTest
import JSONSchema

final class JSONBooleanTests: XCTestCase {

    func test_decode() throws {
        let json = try JSON("""
            {"type":"boolean"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .boolean)
    }
}

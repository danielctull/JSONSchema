
import JSONSchema
import XCTest

final class NullTests: XCTestCase {

    func test_decode() throws {
        let json = try JSON("""
            {"type":"null"}
            """)
        let type = try JSONType(json)
        XCTAssertEqual(type, .null)
    }
}

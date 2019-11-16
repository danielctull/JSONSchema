#if !canImport(ObjectiveC)
import XCTest

extension JSONIntegerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONIntegerTests = [
        ("test_encode_exclusiveMaximum", test_encode_exclusiveMaximum),
        ("test_encode_exclusiveMinimum", test_encode_exclusiveMinimum),
        ("test_encode_maximum", test_encode_maximum),
        ("test_encode_minimum", test_encode_minimum),
        ("test_encode_multipleOf", test_encode_multipleOf),
        ("test_encode_noValues", test_encode_noValues),
    ]
}

extension JSONNumberTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONNumberTests = [
        ("test_encode_exclusiveMaximum", test_encode_exclusiveMaximum),
        ("test_encode_exclusiveMinimum", test_encode_exclusiveMinimum),
        ("test_encode_maximum", test_encode_maximum),
        ("test_encode_minimum", test_encode_minimum),
        ("test_encode_multipleOf", test_encode_multipleOf),
        ("test_encode_noValues", test_encode_noValues),
    ]
}

extension JSONObjectTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONObjectTests = [
        ("test_decode_", test_decode_),
        ("test_decode_required", test_decode_required),
    ]
}

extension JSONSchemaTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONSchemaTests = [
        ("testHasSchema", testHasSchema),
        ("testNoSchema", testNoSchema),
    ]
}

extension JSONStringTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JSONStringTests = [
        ("test_encode_allValues", test_encode_allValues),
        ("test_encode_maximumLength", test_encode_maximumLength),
        ("test_encode_minimumLength", test_encode_minimumLength),
        ("test_encode_noValues", test_encode_noValues),
        ("test_encode_pattern", test_encode_pattern),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JSONIntegerTests.__allTests__JSONIntegerTests),
        testCase(JSONNumberTests.__allTests__JSONNumberTests),
        testCase(JSONObjectTests.__allTests__JSONObjectTests),
        testCase(JSONSchemaTests.__allTests__JSONSchemaTests),
        testCase(JSONStringTests.__allTests__JSONStringTests),
    ]
}
#endif

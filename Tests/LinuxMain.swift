import XCTest

import JSONSchemaTests

var tests = [XCTestCaseEntry]()
tests += JSONSchemaTests.__allTests()

XCTMain(tests)

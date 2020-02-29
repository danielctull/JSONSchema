import XCTest

import GeneratorTests
import JSONSchemaTests

var tests = [XCTestCaseEntry]()
tests += GeneratorTests.__allTests()
tests += JSONSchemaTests.__allTests()

XCTMain(tests)

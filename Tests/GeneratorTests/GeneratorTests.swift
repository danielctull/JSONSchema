
import Generator
import JSONSchema
import XCTest

final class GeneratorTests: XCTestCase {

    func test() throws {

        let schema = Schema(id: "test", schema: "test", definitions: [
            Defininition(name: "Value", type: .integer()),
            Defininition(name: "Bool", type: .boolean)
        ])

        let generator = Generator(schema: schema, template: """
            {% for definition in schema.definitions %}{{ definition.name }}-{% endfor %}
            """)
        let result = try generator.generate()
        let expected = "Value-Bool-"
        XCTAssertEqual(result, expected)
    }
}

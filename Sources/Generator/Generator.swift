
import JSONSchema
import Stencil

public struct Generator {

    let schema: Schema
    let template: String

    public init(schema: Schema, template: String) {
        self.schema = schema
        self.template = template
    }
}

extension Generator {

    public func generate() throws -> String {
        let environment = Environment()
        return try environment.renderTemplate(string: template, context: ["schema": schema])
    }
}

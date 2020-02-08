
public struct JSONObject {

    public let properties: [Property]

    public init(properties: [Property] = []) {
        self.properties = properties
    }
}

extension JSONObject {

    public struct Property {
        public let name: String
        public let required: Bool
        public let type: JSONType

        public init(name: String, required: Bool, type: JSONType) {
            self.name = name
            self.required = required
            self.type = type
        }
    }
}

extension JSONObject {
    static let typeName = "object"
}

// MARK: - Equatable

extension JSONObject: Equatable {}
extension JSONObject.Property: Equatable {}

// MARK: - Codable

extension JSONObject: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == JSONObject.typeName else { throw IncorrectType() }

        guard let propertiesContainer = try? container.nestedContainer(keyedBy: PropertyKey.self, forKey: .properties) else {
            properties = []
            return
        }

        let requiredNames = try container.decodeIfPresent([String].self, forKey: .required) ?? []

        properties = try propertiesContainer.allKeys.map { key in
            let name = key.stringValue
            let type = try JSONType(from: propertiesContainer.superDecoder(forKey: key))
            let required = requiredNames.contains(name)
            return Property(name: name,
                            required: required,
                            type: type)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(JSONObject.typeName, forKey: .type)
    }

    private enum CodingKeys: String, CodingKey {
        case properties
        case required
        case type
    }

    private struct PropertyKey: CodingKey {

        var stringValue: String
        var intValue: Int?

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = String(intValue)
        }
    }
}

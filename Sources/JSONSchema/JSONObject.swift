
public struct JSONObject {

    public let properties: [Property]?

    public init(properties: [Property]? = nil) {
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

// MARK: - Equatable

extension JSONObject: Equatable {}
extension JSONObject.Property: Equatable {}

// MARK: - Codable

extension JSONObject: Decodable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        print(container.allKeys)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == "object" else { throw IncorrectType() }

        let propertiesContainer = try container.nestedContainer(keyedBy: PropertyKey.self, forKey: .properties)

        properties = try propertiesContainer.allKeys.map { key in
            let name = key.stringValue
            let type = try JSONType(from: propertiesContainer.superDecoder(forKey: key))
            return Property(name: name,
                            required: false,
                            type: type)
        }
    }
}

extension JSONObject: Encodable {

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("object", forKey: .type)
    }
}

extension JSONObject {

    private enum CodingKeys: String, CodingKey {
        case properties = "properties"
        case required = "required"
        case type = "type"
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

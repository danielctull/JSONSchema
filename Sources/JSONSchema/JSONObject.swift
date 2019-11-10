
public struct JSONObject {

    public struct Property {
        let name: String
        let required: Bool
        let type: JSONType
    }

    public let properties: [Property]?

    public init(
        properties: [Property]? = nil
    ) {
        self.properties = properties
    }
}

extension JSONObject: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == "object" else { throw IncorrectType() }

        properties = nil
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("object", forKey: .type)
    }

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }
}

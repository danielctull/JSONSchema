
public struct JSONArray {

    public init(
    ) {
    }
}

extension JSONArray {
    static let typeName = "array"
}

// MARK: - Equatable

extension JSONArray: Equatable {}

// MARK: - Codable

extension JSONArray: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == JSONArray.typeName else { throw IncorrectType() }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(JSONArray.typeName, forKey: .type)

    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}

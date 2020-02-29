
public struct Schema {
    public let id: String?
    public let schema: String?
    public let definitions: [Defininition]

    public init(id: String? = nil,
                schema: String? = nil,
                definitions: [Defininition] = []) {
        self.id = id
        self.schema = schema
        self.definitions = definitions
    }
}

// MARK: - Equatable

extension Schema: Equatable {}

// MARK: - Codable

extension Schema: Codable {

    private enum CodingKeys: String, CodingKey {
        case id = "$id"
        case schema = "$schema"
        case definitions = "$defs"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        schema = try container.decodeIfPresent(String.self, forKey: .schema)
        definitions = try container.decodeIfPresent([Defininition].self, forKey: .definitions) ?? []
    }
}


public struct JSONArray {

    public let itemValidation: ItemValidation?
    public let minimumItems: Int?
    public let maximumItems: Int?

    public init(
        itemValidation: ItemValidation? = nil,
        minimumItems: Int? = nil,
        maximumItems: Int? = nil
    ) {
        self.itemValidation = itemValidation
        self.minimumItems = minimumItems
        self.maximumItems = maximumItems
    }
}

extension JSONArray {

    public indirect enum ItemValidation {
        case list(JSONType)
    }
}

extension JSONArray {
    static let typeName = "array"
}

// MARK: - Equatable

extension JSONArray: Equatable {}
extension JSONArray.ItemValidation: Equatable {}

// MARK: - Codable

extension JSONArray: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == JSONArray.typeName else { throw IncorrectType() }

        minimumItems = try container.decodeIfPresent(Int.self, forKey: .minItems)
        maximumItems = try container.decodeIfPresent(Int.self, forKey: .maxItems)

        if let itemType = try? container.decodeIfPresent(JSONType.self, forKey: .items) {
            itemValidation = .list(itemType)
        } else {
            itemValidation = nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(JSONArray.typeName, forKey: .type)

    }

    private enum CodingKeys: String, CodingKey {
        case type
        case items
        case minItems
        case maxItems
    }
}

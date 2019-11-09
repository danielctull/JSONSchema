
public struct JSONString {
    public let minimumLength: Int?
    public let maximumLength: Int?

    public init(
        minimumLength: Int? = nil,
        maximumLength: Int? = nil
    ) {
        self.minimumLength = minimumLength
        self.maximumLength = maximumLength
    }
}

struct IncorrectType: Error {}

extension JSONString: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == "string" else { throw IncorrectType() }

        self.minimumLength = try container.decodeIfPresent(Int.self, forKey: .minimumLength)
        self.maximumLength = try container.decodeIfPresent(Int.self, forKey: .maximumLength)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("string", forKey: .type)
        try container.encodeIfPresent(minimumLength, forKey: .minimumLength)
        try container.encodeIfPresent(maximumLength, forKey: .maximumLength)
    }

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case minimumLength = "minLength"
        case maximumLength = "maxLength"
    }
}

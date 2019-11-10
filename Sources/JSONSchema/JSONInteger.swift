
public struct JSONInteger {

    public let multipleOf: Int?
    public let minimum: Int?
    public let exclusiveMinimum: Int?
    public let maximum: Int?
    public let exclusiveMaximum: Int?

    public init(
        multipleOf: Int? = nil,
        minimum: Int? = nil,
        exclusiveMinimum: Int? = nil,
        maximum: Int? = nil,
        exclusiveMaximum: Int? = nil
    ) {
        self.multipleOf = multipleOf
        self.minimum = minimum
        self.exclusiveMinimum = exclusiveMinimum
        self.maximum = maximum
        self.exclusiveMaximum = exclusiveMaximum
    }
}

extension JSONInteger {
    static let typeName = "integer"
}

// MARK: - Equatable

extension JSONInteger: Equatable {}

// MARK: - Codable

extension JSONInteger: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == JSONInteger.typeName else { throw IncorrectType() }

        multipleOf = try container.decodeIfPresent(Int.self, forKey: .multipleOf)
        minimum = try container.decodeIfPresent(Int.self, forKey: .minimum)
        exclusiveMinimum = try container.decodeIfPresent(Int.self, forKey: .exclusiveMinimum)
        maximum = try container.decodeIfPresent(Int.self, forKey: .maximum)
        exclusiveMaximum = try container.decodeIfPresent(Int.self, forKey: .exclusiveMaximum)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(JSONInteger.typeName, forKey: .type)
        try container.encodeIfPresent(multipleOf, forKey: .multipleOf)
        try container.encodeIfPresent(minimum, forKey: .minimum)
        try container.encodeIfPresent(exclusiveMinimum, forKey: .exclusiveMinimum)
        try container.encodeIfPresent(maximum, forKey: .maximum)
        try container.encodeIfPresent(exclusiveMaximum, forKey: .exclusiveMaximum)
        
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case multipleOf
        case minimum
        case exclusiveMinimum
        case maximum
        case exclusiveMaximum
    }
}

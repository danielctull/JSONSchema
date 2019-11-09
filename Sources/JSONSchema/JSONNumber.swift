
public struct JSONNumber {

    public let multipleOf: Double?
    public let minimum: Double?
    public let exclusiveMinimum: Double?
    public let maximum: Double?
    public let exclusiveMaximum: Double?

    public init(
        multipleOf: Double? = nil,
        minimum: Double? = nil,
        exclusiveMinimum: Double? = nil,
        maximum: Double? = nil,
        exclusiveMaximum: Double? = nil
    ) {
        self.multipleOf = multipleOf
        self.minimum = minimum
        self.exclusiveMinimum = exclusiveMinimum
        self.maximum = maximum
        self.exclusiveMaximum = exclusiveMaximum
    }
}

extension JSONNumber: Codable {

    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let typeName = try container.decode(String.self, forKey: .type)
        guard typeName == "number" else { throw IncorrectType() }

        multipleOf = try container.decodeIfPresent(Double.self, forKey: .multipleOf)
        minimum = try container.decodeIfPresent(Double.self, forKey: .minimum)
        exclusiveMinimum = try container.decodeIfPresent(Double.self, forKey: .exclusiveMinimum)
        maximum = try container.decodeIfPresent(Double.self, forKey: .maximum)
        exclusiveMaximum = try container.decodeIfPresent(Double.self, forKey: .exclusiveMaximum)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("number", forKey: .type)
        try container.encodeIfPresent(multipleOf, forKey: .multipleOf)
        try container.encodeIfPresent(minimum, forKey: .minimum)
        try container.encodeIfPresent(exclusiveMinimum, forKey: .exclusiveMinimum)
        try container.encodeIfPresent(maximum, forKey: .maximum)
        try container.encodeIfPresent(exclusiveMaximum, forKey: .exclusiveMaximum)

    }

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case multipleOf = "multipleOf"
        case minimum = "minimum"
        case exclusiveMinimum = "exclusiveMinimum"
        case maximum = "maximum"
        case exclusiveMaximum = "exclusiveMaximum"
    }
}

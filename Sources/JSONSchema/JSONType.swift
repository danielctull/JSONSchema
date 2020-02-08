
public enum JSONType {
    case array(JSONArray)
    case boolean
    case integer(JSONInteger)
    case null
    case number(JSONNumber)
    case object(JSONObject)
    case string(JSONString)
}

// MARK: - Equatable

extension JSONType: Equatable {}

// MARK: - Codable

extension JSONType: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeName = try container.decode(String.self, forKey: .type)

        switch typeName {
        case JSONArray.typeName: self = .array(try JSONArray(from: decoder))
        case JSONBoolean.typeName: self = .boolean
        case JSONInteger.typeName: self = .integer(try JSONInteger(from: decoder))
        case JSONNull.typeName: self = .null
        case JSONNumber.typeName: self = .number(try JSONNumber(from: decoder))
        case JSONObject.typeName: self = .object(try JSONObject(from: decoder))
        case JSONString.typeName: self = .string(try JSONString(from: decoder))
        default: throw UnknownType(name: typeName)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case let .array(array):
            try container.encode(JSONArray.typeName, forKey: .type)
            try array.encode(to: encoder)
        case .boolean:
            try container.encode(JSONBoolean.typeName, forKey: .type)
        case let .integer(integer):
            try container.encode(JSONInteger.typeName, forKey: .type)
            try integer.encode(to: encoder)
        case .null:
            try container.encode(JSONNull.typeName, forKey: .type)
        case let .number(number):
            try container.encode(JSONNumber.typeName, forKey: .type)
            try number.encode(to: encoder)
        case let .object(object):
            try container.encode(JSONObject.typeName, forKey: .type)
            try object.encode(to: encoder)
        case let .string(string):
            try container.encode(JSONString.typeName, forKey: .type)
            try string.encode(to: encoder)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}

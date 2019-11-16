
public enum JSONType {
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

extension JSONType: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeName = try container.decode(String.self, forKey: .type)

        switch typeName {
        case JSONBoolean.typeName: self = .boolean
        case JSONInteger.typeName: self = .integer(try JSONInteger(from: decoder))
        case JSONNull.typeName: self = .null
        case JSONNumber.typeName: self = .number(try JSONNumber(from: decoder))
        case JSONObject.typeName: self = .object(try JSONObject(from: decoder))
        case JSONString.typeName: self = .string(try JSONString(from: decoder))
        default: throw UnknownType()
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}

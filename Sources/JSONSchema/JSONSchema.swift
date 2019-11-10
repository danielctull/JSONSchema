
public struct JSONSchema: Codable {
    public let schema: String?
}

extension JSONSchema: Equatable {}

extension JSONSchema {

    enum CodingKeys: String, CodingKey {
        case schema = "$schema"
    }
}

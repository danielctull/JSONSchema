
public struct JSONSchema: Codable {
    public let schema: String?
}

extension JSONSchema {

    enum CodingKeys: String, CodingKey {
        case schema = "$schema"
    }
}


public struct JSONSchema {
    public let schema: String?
}

// MARK: - Equatable

extension JSONSchema: Equatable {}

// MARK: - Codable

extension JSONSchema: Codable {

    private enum CodingKeys: String, CodingKey {
        case schema = "$schema"
    }
}

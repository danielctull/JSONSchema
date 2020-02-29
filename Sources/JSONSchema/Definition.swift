
public struct Defininition {
    public let name: String
    public let type: JSONType

    public init(name: String,
                type: JSONType) {
        self.name = name
        self.type = type
    }
}

extension Defininition: Equatable {}

extension Defininition: Codable {}

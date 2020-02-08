
import Foundation

struct JSON: Equatable {

    fileprivate let data: Data
    init(_ string: String) throws {
        guard let data = string.data(using: .utf8) else {
            struct Error: Swift.Error {}
            throw Error()
        }
        self.data = data
    }
}

extension JSON: CustomStringConvertible {
    var description: String { String(data: data, encoding: .utf8) ?? "UNKNOWN" }
}

extension JSONDecoder {

    func decode<T: Decodable>(_ type: T.Type, from json: JSON) throws -> T {
        try decode(type, from: json.data)
    }
}

extension Decodable {

    init(_ json: JSON) throws {
        self = try JSONDecoder().decode(Self.self, from: json)
    }
}

extension JSON {

    init<T: Encodable>(_ value: T) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        data = try encoder.encode(value)
    }
}

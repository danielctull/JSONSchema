
import Foundation

struct JSON {

    fileprivate let data: Data
    init(_ string: String) throws {
        guard let data = string.data(using: .utf8) else {
            struct Error: Swift.Error {}
            throw Error()
        }
        self.data = data
    }
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

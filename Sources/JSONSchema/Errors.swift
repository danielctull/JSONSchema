
import Foundation

struct UnknownType: Error {
    let name: String
}

extension UnknownType: CustomStringConvertible {
    var description: String { "Unknown type \(name)" }
}

struct IncorrectType: Error {}

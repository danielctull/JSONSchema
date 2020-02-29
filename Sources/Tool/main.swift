
import ArgumentParser

struct JSONSchema: ParsableCommand {

    static let configuration = CommandConfiguration(
        abstract: "json-schema utility.",
        subcommands: [Generate.self])
}

JSONSchema.main()

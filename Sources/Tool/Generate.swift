
import ArgumentParser

struct Generate: ParsableCommand {

    static let configuration = CommandConfiguration(
        abstract: "Generates files using a json schema.")

    @Option(name: [.short, .long], help: ArgumentHelp("The location of the input stencil file.", valueName: "stencil"))
    var input: String

    @Option(name: [.short, .long], help: "The location of the schema.")
    var schema: String

    @Option(name: [.short, .long], help: "Directory of where to put the generated files.")
    var output: String

    func run() throws {
    }
}

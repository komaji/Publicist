import ArgumentParser

struct Command: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "publicist",
      abstract: "Change internal access level into public."
    )

    @Argument(help: "Path to target file.")
    var filePath: String

    @Flag(name: .shortAndLong, help: "Print the output without writing the file to disk. Default is false.")
    var dryRun: Bool = false

    func run() throws {
        let argumentGroup = ArgumentGroup(
            filePath: filePath,
            dryRun: dryRun
        )
        try Runner(argumentGroup: argumentGroup).run()
    }
}

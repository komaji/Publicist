import ArgumentParser

struct Command: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "hesoten",
      abstract: "hesoten!!!"
    )

    @Argument(help: "File path.")
    var filePath: String

    func run() throws {
        print(filePath)
    }
}

Command.main()

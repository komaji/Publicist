import ArgumentParser

struct Command: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "hesoten",
      abstract: "hesoten!!!"
    )

    func run() throws {
        print("Hello, world!")
    }
}

Command.main()

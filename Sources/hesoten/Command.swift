import ArgumentParser
import HesotenKit

struct Command: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "hesoten",
      abstract: "hesoten!!!"
    )

    @Argument(help: "File path.")
    var filePath: String

    func run() throws {
        try Runner(filePath: filePath).run()
    }
}

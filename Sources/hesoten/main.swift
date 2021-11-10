import ArgumentParser
import Foundation

struct Command: ParsableCommand {
    enum RunError: Error {
        case invalidPath
        case invalidFile
    }

    static var configuration = CommandConfiguration(
      commandName: "hesoten",
      abstract: "hesoten!!!"
    )

    @Argument(help: "File path.")
    var filePath: String

    func run() throws {
        print(filePath)

        guard let fileHandle = FileHandle(forReadingAtPath: filePath) else {
            throw RunError.invalidPath
        }

        let sourceData = fileHandle.readDataToEndOfFile()
        defer { fileHandle.closeFile() }

        guard let text = String(data: sourceData, encoding: .utf8) else {
            throw RunError.invalidFile
        }

        var buffer = text
        buffer += "struct Hoge\(Int.random(in: 1 ..< 10000)) {}\n"

        let data = buffer.data(using: .utf8)!
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print(error)
        }
    }
}

Command.main()

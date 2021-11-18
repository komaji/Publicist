import ArgumentParser
import Foundation
import SwiftSyntax

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

        guard let originalSource = String(data: sourceData, encoding: .utf8) else {
            throw RunError.invalidFile
        }

        print(originalSource)
        print("")

        do {
            let syntax = try SyntaxParser.parse(source: originalSource)
            let resultSource = AccessLevelRewriter().visit(syntax).description
            print(resultSource)
            // let resultData = resultSource.data(using: .utf8)!
            // let fileURL = URL(fileURLWithPath: filePath)
            // try resultData.write(to: fileURL, options: .atomic)

        } catch {
            print(error)
        }
    }
}

Command.main()

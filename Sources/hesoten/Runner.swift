import Foundation
import HesotenKit

struct Runner {
    enum RunError: Error {
        case invalidPath
        case invalidFile
    }

    private let filePath: String
    private var fileURL: URL { .init(fileURLWithPath: filePath) }

    init(filePath: String) {
        self.filePath = filePath
    }

    func run() throws {
        print("📝 Rewriting \(filePath)")

        guard let fileHandle = FileHandle(forReadingAtPath: filePath) else {
            throw RunError.invalidPath
        }

        let sourceData = fileHandle.readDataToEndOfFile()
        defer { fileHandle.closeFile() }

        guard let originalSource = String(data: sourceData, encoding: .utf8) else {
            throw RunError.invalidFile
        }

        let resultSource = try AccessLevelRewriter.rewrite(source: originalSource)
        let resultData = resultSource.data(using: .utf8)!
        try resultData.write(to: fileURL, options: .atomic)

        print("✅ Complete")
    }
}

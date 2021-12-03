import Foundation
import PublicistKit

struct Runner {
    let argumentGroup: ArgumentGroup

    private var fileURL: URL { .init(fileURLWithPath: argumentGroup.filePath) }

    func run() throws {
        print("📝 Rewriting \(argumentGroup.filePath)")

        guard let fileHandle = FileHandle(forReadingAtPath: argumentGroup.filePath) else {
            throw PublicistError.invalidPath
        }

        let sourceData = fileHandle.readDataToEndOfFile()
        defer { fileHandle.closeFile() }

        guard let originalSource = String(data: sourceData, encoding: .utf8) else {
            throw PublicistError.invalidFile
        }

        let resultSource = try AccessLevelRewriter.rewrite(source: originalSource)

        if argumentGroup.dryRun {
            print(resultSource)
        } else {
            let resultData = resultSource.data(using: .utf8)!
            try resultData.write(to: fileURL, options: .atomic)
        }

        print("✅ Complete")
    }
}

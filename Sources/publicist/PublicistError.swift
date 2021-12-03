import Foundation

enum PublicistError: String, LocalizedError {
    case invalidPath = "invalid file path."
    case invalidFile = "invalid file."

    var errorDescription: String? { rawValue }
}

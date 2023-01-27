import Foundation

func readFromFile(fileName: String) -> String {
    var line: String
    do {
        line = try String(contentsOfFile: fileName)
    } catch let error as NSError {
        print("read file error: \(error.localizedDescription)")
        return ""
    }

    return line
}

func writeInFile(fileName: String, str: String) {
    try? str.write(toFile: fileName, atomically: true, encoding: .utf8)
}

func appendInFile(fileName: String, str: String) {
    var toFile: String = readFromFile(fileName: fileName)
    toFile += str
    writeInFile(fileName: fileName, str: toFile)
}

func getDataDirectory() -> String {
    return "/Users/anatolijmironcenko/Documents/swift/files/bin/"
}

func createDirectory(dirName: String) {
    do {
        try FileManager.default.createDirectory(atPath: getDataDirectory() + "data/" + dirName, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
        print("Error creating directory: \(error.localizedDescription)")
    }
}

func removeDirectory(dirName: String) {
    try? FileManager.default.removeItem(atPath: getDataDirectory() + "data/" + dirName)
}

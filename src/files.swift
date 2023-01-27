import Foundation

// function for read some string from file
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

// function for write some string in file
func writeInFile(fileName: String, str: String) {
    try? str.write(toFile: fileName, atomically: true, encoding: .utf8)
}

// function for appending some string in file
func appendInFile(fileName: String, str: String) {
    var toFile: String = readFromFile(fileName: fileName)
    toFile += str
    writeInFile(fileName: fileName, str: toFile)
}

// function for get data directory
func getDataDirectory() -> String {
    return "/Users/anatolijmironcenko/Documents/swift/files/release/"
}

// function for create directory
func createDirectory(dirName: String) {
    do {
        try FileManager.default.createDirectory(atPath: getDataDirectory() + "data/" + dirName, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
        print("Error creating directory: \(error.localizedDescription)")
    }
}

// function for remove directory
func removeDirectory(dirName: String) {
    try? FileManager.default.removeItem(atPath: getDataDirectory() + "data/" + dirName)
}

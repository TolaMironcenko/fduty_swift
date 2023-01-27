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

func createDirectory(dirName: String) {
    let dataDirectory: String = "/Users/anatolijmironcenko/Documents/swift/files/bin/"
    do {
        try FileManager.default.createDirectory(atPath: dataDirectory + "data/" + dirName, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
        print("Error creating directory: \(error.localizedDescription)")
    }
}

func removeDirectory(dirName: String) {
    let dataDirectory: String = "/Users/anatolijmironcenko/Documents/swift/files/bin/"
    try? FileManager.default.removeItem(atPath: dataDirectory + "data/" + dirName)
}
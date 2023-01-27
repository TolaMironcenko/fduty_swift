import Foundation

func get_all_chets() -> [URL] {
    var all_chets: [URL]

    let dataDirectory: URL = URL(string: "/Users/anatolijmironcenko/Documents/swift/files/bin/data/")!

    all_chets = try! FileManager.default.contentsOfDirectory(
        at: dataDirectory,
        includingPropertiesForKeys: nil
    )

    return all_chets
}

func createChet(chetName: String) {
    let dataDirectory: String = "/Users/anatolijmironcenko/Documents/swift/files/bin/"

    createDirectory(dirName: chetName)
    if (readFromFile(fileName: dataDirectory + "data/" + chetName + "/balance") == "" && readFromFile(fileName: dataDirectory + "data/" + chetName + "/transactions") == "") {
        writeInFile(fileName: dataDirectory + "data/" + chetName + "/balance", str: "0")
        writeInFile(fileName: dataDirectory + "data/" + chetName + "/transactions", str: "")
        print("Chet create successful")
    } else {
        print("Chet already exists")
    }
}

func deleteChet(chetName: String) {
    if (chetName == "main" || chetName == "MAIN") {
        print("You can't delete main chet!")
    } else {
        removeDirectory(dirName: chetName)
        print("Chet delete successful")
    }
}
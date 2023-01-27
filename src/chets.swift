import Foundation

func get_all_chets() -> [URL] {
    var all_chets: [URL]

    let dataDirectory: URL = URL(string: getDataDirectory() + "data/")!

    all_chets = try! FileManager.default.contentsOfDirectory(
        at: dataDirectory,
        includingPropertiesForKeys: nil
    )

    return all_chets
}

func createChet(chetName: String) {
    createDirectory(dirName: chetName)
    if (readFromFile(fileName: getDataDirectory() + "data/" + chetName + "/balance") == "" && readFromFile(fileName: getDataDirectory() + "data/" + chetName + "/transactions") == "") {
        writeInFile(fileName: getDataDirectory() + "data/" + chetName + "/balance", str: "0")
        writeInFile(fileName: getDataDirectory() + "data/" + chetName + "/transactions", str: "")
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
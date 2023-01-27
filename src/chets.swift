import Foundation

// function for get url for all chets
func get_all_chets() -> [URL] {
    var all_chets: [URL]

    let dataDirectory: URL = URL(string: getDataDirectory() + "data/")!

    all_chets = try! FileManager.default.contentsOfDirectory(
        at: dataDirectory,
        includingPropertiesForKeys: nil
    )

    return all_chets
}

// function for create a new chet
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

// function for delete a chet
func deleteChet(chetName: String) {
    if (chetName == "main" || chetName == "MAIN") {
        print("You can't delete main chet!")
    } else {
        removeDirectory(dirName: chetName)
        print("Chet delete successful")
    }
}

// function for get info about all chets or one chet
func getInfo() {
    let all_chets: [URL] = get_all_chets()

    if (CommandLine.argc < 3) {
        for chet: URL in all_chets {
            var chetarr: [String.SubSequence] = chet.absoluteString.split(separator: "/")
            chetarr.removeFirst()
            let transactions = readFromFile(fileName: "/" + chetarr.joined(separator: "/") + "/transactions").split(separator: "\n")

            print(chetarr[chetarr.count - 1] + " balance: " + readFromFile(fileName: "/" + chetarr.joined(separator: "/") + "/balance"))

            if (transactions.count == 0) {
                print("\nNo transactions.\n")
            } else {
                print("\n")
                for transaction in transactions {
                    print("Transaction: " + transaction)
                }
            }
        }
    } else {
        let transactions = readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[2] + "/transactions").split(separator: "\n")

        print(CommandLine.arguments[2] + " balance: " + readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[2] + "/balance"))

        if (transactions.count == 0) {
            print("\nNo transactions.\n")
        } else {
            for transaction in transactions {
                print("Transaction: " + transaction)
            }
        }
    }
}

// function for get sum for all chets or one chet
func getSum() {
    if (CommandLine.argc < 3) {
        let all_chets: [URL] = get_all_chets()

        for chet: URL in all_chets {
            var chetarr: [String.SubSequence] = chet.absoluteString.split(separator: "/")
            chetarr.removeFirst()
            print(chetarr[chetarr.count - 1] + " balance: " + readFromFile(fileName: "/" + chetarr.joined(separator: "/") + "/balance"))
        }
    } else {
        print(CommandLine.arguments[2] + " balance: " + readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[2] + "/balance"))
    }
}
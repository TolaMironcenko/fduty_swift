import Foundation

func main() {
    let all_chets: [URL] = get_all_chets()

    // get help how to use
    if (CommandLine.argc < 2 || CommandLine.arguments[1] == "-h" || CommandLine.arguments[1] == "-help") {
        print("use " + CommandLine.arguments[0] + " + some")
        exit(0)
    }
    
    // get info about all chets
    if (CommandLine.arguments[1] == "-i" || CommandLine.arguments[1] == "-info") {
        if (CommandLine.argc < 3) {
            for chet in all_chets {
                var chetarr = chet.absoluteString.split(separator: "/")
                chetarr.removeFirst()
                let transactions = readFromFile(fileName: "/" + chetarr.joined(separator: "/") + "/transactions").split(separator: "\n")

                print(chetarr[chetarr.count - 1] + " balance: " + readFromFile(fileName: "/" + chetarr.joined(separator: "/") + "/balance"))

                if (transactions.count == 0) {
                    print("\nNo transactions.\n")
                } else {
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

    // create a new chet
    if (CommandLine.arguments[1] == "-n" || CommandLine.arguments[1] == "-new") {
        if (CommandLine.argc < 3) {
            print("use " + CommandLine.arguments[0] + " " + CommandLine.arguments[1] + " chet_name")
            exit(0)
        }
        createChet(chetName: CommandLine.arguments[2])
    }

    // delete a chet
    if (CommandLine.arguments[1] == "-d" || CommandLine.arguments[1] == "-delete") {
        if (CommandLine.argc < 3) {
            print("use " + CommandLine.arguments[0] + " " + CommandLine.arguments[1] + " chet_name")
            exit(0)
        }
        deleteChet(chetName: CommandLine.arguments[2])
    }

    // add transaction to some chet
    if (CommandLine.arguments[1] == "-a" || CommandLine.arguments[1] == "-add_transaction") {
        if (CommandLine.argc < 4) {
            print("use " + CommandLine.arguments[0] + " " + CommandLine.arguments[1] + " sum " + "chet_name")
            exit(0)
        }

        appendInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/transactions", str: CommandLine.arguments[2] + "\n")
        var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance") as NSString).floatValue
        newBalance += (CommandLine.arguments[2] as NSString).floatValue
        writeInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance", str: String(format: "%.2f", newBalance))
        print(CommandLine.arguments[3] + " balance: " + String(format: "%.2f", newBalance))
    }
}

main()
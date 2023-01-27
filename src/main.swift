import Foundation

func main() {

    // get help how to use
    if (CommandLine.argc < 2 || CommandLine.arguments[1] == "-h" || CommandLine.arguments[1] == "-help") {
        print("use " + CommandLine.arguments[0] + " + some")
        exit(0)
    }
    
    // get info about all chets or one chet
    if (CommandLine.arguments[1] == "-i" || CommandLine.arguments[1] == "-info") {
        getInfo()
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
        createTransaction()
    }

    // get sum all chets or one chet
    if (CommandLine.arguments[1] == "-s" || CommandLine.arguments[1] == "-sum") {
        getSum()
    }

}

main()

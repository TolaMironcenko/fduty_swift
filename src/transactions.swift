import Foundation

// function for create a transaction
func createTransaction() {
    if (CommandLine.arguments[3] != "main") {
        appendInFile(fileName: getDataDirectory() + "data/" + "main" + "/transactions", str: CommandLine.arguments[2] + "\n")
        var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + "main" + "/balance") as NSString).floatValue
        newBalance += (CommandLine.arguments[2] as NSString).floatValue
        writeInFile(fileName: getDataDirectory() + "data/" + "main" + "/balance", str: String(format: "%.2f", newBalance))
        print("main" + " balance: " + String(format: "%.2f", newBalance))
    }
    appendInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/transactions", str: CommandLine.arguments[2] + "\n")
    var newBalance: Float = (readFromFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance") as NSString).floatValue
    newBalance += (CommandLine.arguments[2] as NSString).floatValue
    writeInFile(fileName: getDataDirectory() + "data/" + CommandLine.arguments[3] + "/balance", str: String(format: "%.2f", newBalance))
    print(CommandLine.arguments[3] + " balance: " + String(format: "%.2f", newBalance))
}
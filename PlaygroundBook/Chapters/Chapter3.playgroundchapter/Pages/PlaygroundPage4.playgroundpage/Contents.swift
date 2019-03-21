/*:
 4th Exercise: **Check Methods**
 
If your function returns boolean, just take a closer look and see if you can write it in a bitter way, because most of the times, it can be written in a simpler way.
 
 - Note: let's assume we have this function. Try to write the body of the method in a single line.
*/

//#-editable-code
func isItemExist(x: Int, items: [Int]) -> Bool {
    if items.contains(x) {
        return true
    }else{
        return false
    }
}
//#-end-editable-code

//#-hidden-code
import PlaygroundSupport
import Foundation

public func findUserCodeInputs(from input: String) -> [String] {
    var inputs: [String] = []
    let scanner = Scanner(string: input)
    while scanner.scanUpTo("//#-editable-code", into: nil) {
        var userInput: NSString? = ""
        scanner.scanUpTo("\n", into: nil)
        scanner.scanUpTo("//#-end-editable-code", into: &userInput)
        
        if userInput != nil {
            inputs.append(String(userInput!))
        }
    }
    return inputs
}

public func makeAssessment(of input: String) {
    let codeInputs = findUserCodeInputs(from: input)
    let currentCode = codeInputs[0]
    if !currentCode.contains("return items.contains(x)"){
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution: "Try this code:\n'return items.contains(x)'")
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "Great job! Now continue with the next exercise")
}

makeAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

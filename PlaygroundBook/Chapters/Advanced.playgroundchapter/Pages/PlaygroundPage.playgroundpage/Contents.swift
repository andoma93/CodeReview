/*:
 Some noising topic **Complexity**
 
Counting source lines of code (SLOC), or the number of lines or "statements" in the source code, is one simple metric used to measure the size of a software program. Try to write this code in few lines.
 
 - Note: Write less code lines improving the following function. The following function has to return 'true' if at least one of the items in input is a positive number, 'false' otherwhise
 
*/
//#-editable-code
//#-editable-code
func checkAtLeastOnePositive(items: [Int]) -> Bool {
    var found = false
    for item in items{
        if item > 0{
            found = true
        }
    }
    return found
}
//#-end-editable-code
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

public func makeHelloWorldAssessment(of input: String) {
    let codeInputs = findUserCodeInputs(from: input)
    if !codeInputs[0].contains("return true"){
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution:
            """
            func checkAtLeastOnePositive(items: [Int]) -> Bool {\n
                for item in items{
                    if item > 0{
                        return true
                    }
                }
                return false
            }
            """
        )
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "✅✅✅ Great job! Now continue with the next exercise")
}

makeHelloWorldAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

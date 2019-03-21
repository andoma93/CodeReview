/*:
 **Use early exit**
 
The more loops you have the more effort required from our mind to make sense of it. So with early exit instead of having your code wrapped in one if loop statement, you can just add the condition for which the loop is not executed first and just return if that is the case.
 
 - Note: Mario has pushed this fantastic code. Please add an early exit with guard sintax.
*/

//#-editable-code
func function(items: [Int]) {
    if items.count > 0 {
        for item in items {
            // do something
        }
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
    if !codeInputs[0].contains("guard"){
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution:
            """
            func function(items: [Int]) {
                guard items.count > 0 else { return }
                for item in items {
                    // do something
                }
            }
            """
        )
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "✅✅✅ Great job! Now continue with the next exercise")
}

makeAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

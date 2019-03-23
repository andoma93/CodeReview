/*:
 Third Exercise: **Be Dry**
 
 If we look into this piece of code we see that the call to updateUI function is duplicated twice. This is a bad code because from maintainability perspective if the method definition has changed then you need to change it twice for example now the method takes 2 parameters what if we need to change it to take 3 parameters we have to change it in 2 places.
 
 - Note: Let's assume we have a boolean and it's initialised with false. This method has a poor style: try to improve it!
*/

func updateUI(_ label: String, _ positionValue: Bool){
    print("\(label)-\(positionValue)")
}

//#-editable-code
let isPositionCorrect = false
if isPositionCorrect {
    updateUI("Position Correct", isPositionCorrect)
} else {
    updateUI("Position InCorrect", isPositionCorrect)
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
    let tok =  currentCode.components(separatedBy:"updateUI")
    var occurrences = tok.count-1
    if occurrences != 1{
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution: "Try this code:\n\n'let message = isPositionCorrect ? 'Position Correct' : 'Position InCorrect'\n\n updateUI(message, isPositionCorrect)'")
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "✅✅✅ Great job! Now continue with the next exercise")
}

makeAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

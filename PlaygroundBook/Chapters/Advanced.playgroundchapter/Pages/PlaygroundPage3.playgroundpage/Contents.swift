/*:
 Hard-coded values 😅
 
 This is one of the trivial activities of reviewing code. Whenever you see Hard-coded values, first ask yourself if there is another way you could remove this static value (String, Float, Int,…) and make it configurable? Then go a head and make it better. If there isn’t a way to get ride of it, store it in a static variable (Normally this will be in a constants class/file you use across the project).
 The benefit of doing that obviously is to avoid code duplication. Without storing this static value in a variable, you would need to change the code in all places when your value change.
 
 - Note: Try to change values hard-coded in the following code lines
*/

//#-editable-code
let year : Int = 2019
func test(){
    print("I'll join to WWDC 2019")
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
    if !currentCode.contains("year)") && !currentCode.contains("+year") && !currentCode.contains("+ year"){
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution:
            """
            print("I'll join to WWDC"+year)
            """
        )
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "✅✅✅ Great job! Now continue with the next exercise")
}

makeAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

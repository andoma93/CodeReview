/*:
 First Exercise: **Bang or force unwrapping**
 
 Always ask yourself isn’t there a better way of doing force unwrapping? Maybe a guard, optional chaining or maybe just removing the optional 🤗.
 
 - Note: Mario has pushed this fantastic function in the common repository. Maybe there is something wrong, try to check and fix his code!
 
*/
//#-editable-code
func helloWorld(name: String?){
    //parameter name is never nil
    print("Hello \(name!)!")
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

public func makeHelloWorldAssessment(of input: String) {
    let codeInputs = findUserCodeInputs(from: input)
    if codeInputs[0].contains("String?") && !codeInputs[0].contains("guard") && !codeInputs[0].contains("!= nil"){
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution:
            """
            Check the optional parameters or insert a 'guard' statement
            
            func helloWorld(name: String){\n
                //parameter name is never nil\n
                print("Hello \\\\(name)!")\n
            }
            """
        )
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "✅✅✅ Great job! Now continue with the next exercise")
}

makeHelloWorldAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

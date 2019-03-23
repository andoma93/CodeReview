/*:
 **Delegates implemented in extension**
 
Make sure that code is readable and maintainable by ensuring that delegates are implemented in extensions.
 
 - Note: write 'delegateMethod' in an extension of the class 'Foo : Delegate'
*/
//#-hidden-code
protocol Delegate{
    func delegateMethod()
}
//#-end-hidden-code
//#-editable-code
class Foo : Delegate{
    func delegateMethod (){
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
    if !currentCode.contains("extension Foo"){
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Try again 🧐"], solution:
        """
        class Foo {\n
        }\n
        extension Foo : Delegate {\n
            func delegateMethod (){\n
            }\n
        }
        """
        )
        return
    }
    PlaygroundPage.current.assessmentStatus = .pass(message: "✅✅✅ Great job!")
}

makeAssessment(of: PlaygroundPage.current.text)
//#-end-hidden-code

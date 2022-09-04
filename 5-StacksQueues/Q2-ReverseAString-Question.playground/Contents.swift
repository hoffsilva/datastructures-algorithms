import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

func solution(_ text: String) -> String {
    
    var arrayOfChar = Array(text)
    
    var count = 0
    
    while count < arrayOfChar.count {
        arrayOfChar.insert(arrayOfChar.removeLast(), at: count)
        count += 1
    }
    
    return String(arrayOfChar)
}

solution("abc") // bca
solution("Would you like to play a game?")

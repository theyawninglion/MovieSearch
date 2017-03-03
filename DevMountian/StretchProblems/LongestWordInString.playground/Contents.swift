//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//func checkPalindrome(word: String) -> Bool {
//    
//    if word.characters.count < 2 {
////        == "" || word.characters.count == 1 {
//        return true
//    } else {
//        if word.characters.first == word.characters.last{
//         
//        } else {
//        return false
//    }
//}
//}


func checkPalindrome(in string: String) -> String {
    var returnString = "This is not a palindrome."
    let nonLettersSet = CharacterSet.letters.inverted
    let fullString = string.components(separatedBy: nonLettersSet).joined().lowercased()
    let reversedString = String(fullString.characters.reversed())
    print("• Original word: \(fullString)\n• Reversed word: \(reversedString)")
    if reversedString == fullString {
        returnString = "This is a palindrome."
    }
    return returnString
}


func longest(word: String) -> String {
    let nonLettersSet = CharacterSet.letters.inverted
    let words = word.components(separatedBy: nonLettersSet)
    words.sorted(by: { $1.characters.count > $0.characters.count} )
    let longestWord = words.reduce(words[0]){
        if $1.characters.count < $0.characters.count {
            return $0
        } else {
            return $1
        }
    }
    print(longestWord)
    return longestWord
}

longest(word: "death to nic")
//    
//
func longestWord(in string: String) -> String {
    let nonLettersSet = CharacterSet.letters.inverted
    let words = string.components(separatedBy: nonLettersSet)
    var wordCharCount = 0
    var returnWords = ""
    for word in words {
        if word.characters.count > wordCharCount {
            wordCharCount = word.characters.count
            returnWords = word.lowercased()
        }
    }
    return returnWords
}


func isPalindrome(_ word: String) -> Bool {
    
    let strippedString = word.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
    let length = strippedString.characters.count
    
    if length > 1 {
        
        return palindrome(strippedString.lowercased(), left: 0, right: length - 1)
    }
    return false
}

private func palindrome(_ word: String, left: Int, right: Int) -> Bool {
    if left >= right {
        print ("\(word) is a palindrome")
        return true
    }
    let lhs = word[word.index(word.startIndex, offsetBy: left)]
    let rhs = word[word.index(word.startIndex, offsetBy: right)]
    
    if lhs != rhs {
        print("This is not a palindrome")
        return false
    }
    return palindrome(word, left: left + 1, right: right - 1)
}


isPalindrome("Dammit, I'm mad!")



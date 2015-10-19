//
//  ConvertToRomanInteractor.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 16/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

enum Position: Int {
    case Ones = 0
    case Tens = 1
    case Hundreds = 2
    case Thousands = 3
    
    func getHigherPosition() -> Position {
        switch self {
        case .Ones:
            return .Tens
        case .Tens:
            return .Hundreds
        case .Hundreds:
            return .Thousands
        default:
            return self
        }
    }
}

class ConvertToRomanInteractor {
    
    var currentPosition: Position = .Ones
    
    func convert(arabic: String) -> String {
        currentPosition = .Ones
        var roman = ""
        
        for character in arabic.characters.reverse() {
            let digit = Int(String(character))!
            roman = convertDigit(digit) + roman
            currentPosition = currentPosition.getHigherPosition()
        }
        
        return roman
    }
    
    private func convertDigit(digit: Int) -> String {
        var digitString = ""
        
        switch digit {
        case 1...3:
            digitString += singlesForPosition(currentPosition, count: digit)
            break
        case 4:
            digitString += singleForPosition(currentPosition)
            digitString += fiveForPosition(currentPosition)
        case 5:
            digitString += fiveForPosition(currentPosition)
        case 6...8:
            digitString += fiveForPosition(currentPosition)
            digitString += singlesForPosition(currentPosition, count: digit-5)
        case 9:
            digitString += singleForPosition(currentPosition)
            digitString += singleForPosition(currentPosition.getHigherPosition())
        default:
            break
        }
        
        return digitString
    }
    
    private func singlesForPosition(position: Position, count: Int) -> String {
        var singles = ""

        for var i = 0; i < count; i++ {
            singles += singleForPosition(position)
        }
        
        return singles
    }
    
    private func singleForPosition(position: Position) -> String {
        switch position {
        case .Ones:
            return "I"
        case .Tens:
            return "X"
        case .Hundreds:
            return "C"
        case .Thousands:
            return "M"
        }
    }
    
    private func fiveForPosition(position: Position) -> String {
        switch position {
        case .Ones:
            return "V"
        case .Tens:
            return "L"
        case .Hundreds:
            return "D"
        case .Thousands:
            return ""
        }
    }
}


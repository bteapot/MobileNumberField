//
//  String+Digits.swift
//  MobileNumberField
//
//  Created by Денис Либит on 03.08.2024.
//

import Foundation


extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var digits: String {
        return String(
            self.unicodeScalars
                .filter(CharacterSet.decimalDigits.contains)
        )
    }
    
    var digitsAndSlots: String {
        return String(
            self.unicodeScalars
                .filter { $0 == "#" || CharacterSet.decimalDigits.contains($0) }
        )
    }
}

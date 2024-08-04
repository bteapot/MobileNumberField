//
//  Country.swift
//  MobileNumberField
//
//  Created by Денис Либит on 04.08.2024.
//

import Foundation
import SwiftUI


public struct Country: Sendable, Hashable {
    public let id: String
    public let code: String
    public let masks: [String]
    
    public let locale: Locale
    public let name: String
    
    public init(id: String, code: String, masks: [String], locale system: Locale) {
        let locale = Locale(components: .init(languageRegion: .init(id)))
        
        if  let identifier = locale.region?.identifier,
            let countryName = system.localizedString(forRegionCode: identifier)
        {
            self.id = id
            self.code = code
            self.masks = masks
            self.locale = locale
            self.name = countryName
        } else {
            fatalError()
        }
    }
}

// MARK: - Страна по-умолчанию

extension Country {
    @MainActor
    public static var `default`: Self =
        Self.countries(with: .current)
            .first(where: { $0.id == Locale.current.language.languageCode?.identifier })
            ?? .init(id: "RU", code: "7", masks: ["(###)###-##-##"], locale: .current)
}

// MARK: - Флаг

extension Country {
    // https://stackoverflow.com/a/60413173/826716
    public var flag: String {
        self.id
            .unicodeScalars
            .map { 127397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
}

// MARK: - Формат

extension Country {
    public func format(phone: String) -> String {
        // оставим только цифры
        var phone = phone.digits
        
        // откусим код страны
        phone.trimPrefix(self.code.digits)
        
        // получим наиболее подходящую маску
        var mask = self.mask(for: phone)
        
        // отформатируем
        var formatted: String = ""
        
        for c in phone {
            maskLoop: while mask.isEmpty == false {
                let m = mask.removeFirst()
                
                switch m {
                    case "#", "0"..."9":
                        formatted.append(String(c))
                        break maskLoop
                        
                    default:
                        formatted.append(String(m))
                }
            }
        }
        
        // отдадим
        return "+" + self.code + " " + formatted
    }
    
    func mask(for number: String) -> String {
        // оставим только цифры
        var number = number
        
        // откусим код страны
        number.trimPrefix(self.code.digits)
        
        // обработаем оставшийся номер
        
        // наиболее подходящая маска и максимальное количество цифр
        var score = 0
        var mask: String = self.masks.first ?? ""
        
        for m in self.masks {
            let f = m.digitsAndSlots
            // попадание?
            if let s = self.score(for: number, with: f) {
                // с лучшим результатом?
                if s > score {
                    score = s
                    mask = m
                }
            }
        }
        
        return mask
    }
}

// MARK: - Инструменты

extension Country {
    func score(for phone: String) -> Int? {
        // цена совпадения кода страны
        let code = self.code.digits
        
        guard let countryScore = self.score(for: phone, with: code) else {
            // расхождение
            return nil
        }
        
        // цены совпадений масок номеров
        let tail = phone.dropFirst(code.count)
        
        guard let maskScore =
            self.masks
                .compactMap({ self.score(for: tail, with: $0.digitsAndSlots) })
                .max()
        else {
            // расхождение
            return nil
        }
        
        // отдадим
        return countryScore + maskScore
    }
    
    func score<S: StringProtocol>(for number: S, with mask: String) -> Int? {
        var digits = Array(number)
        var score: Int = 0
        
        // пройдёмся по маске
        for char in mask {
            // не конец номера?
            guard digits.isEmpty == false else {
                return score
            }
            
            // следующая цифра номера
            let digit = digits[0]
            
            switch char {
                case digit:
                    // точное совпадение цифры
                    score += 100
                    
                case "#":
                    // совпадение по маске
                    score += 1
                    
                default:
                    // расхождение
                    return nil
            }
            
            // откусываем
            digits.removeFirst()
        }
        
        return score
    }
}

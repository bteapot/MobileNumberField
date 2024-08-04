//
//  MobileNumberFieldTests.swift
//  MobileNumberField
//
//  Created by Денис Либит on 04.08.2024.
//

import XCTest
@testable import MobileNumberField


final class MobileNumberFieldTests: XCTestCase {
    func testCountriesList() throws {
        let countries = Country.countries(with: .current)
        
        let ids = Set(countries.map(\.id))
        XCTAssertEqual(ids.count, countries.count, "Страны не должны дублироваться.")
        
        for country in countries {
            XCTAssertFalse(country.code.digits.isEmpty, "В коде страны должны быть цифры.")
            XCTAssertFalse(country.masks.isEmpty, "У страны должна быть минимум одна маска номера.")
            
            var previous: Int = 0
            
            for mask in country.masks {
                // количество слотов для цифр
                let count = mask.filter({ $0 == "#" }).count
                
                // есть слоты, и их больше, чем в предыдущей маске
                XCTAssertTrue(count > previous, "Маска номера должна иметь слоты для цифр, и маски должны быть расположены по увеличению количества слотов.")
                previous = count
            }
        }
    }
}

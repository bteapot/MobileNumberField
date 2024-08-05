//
//  MobileNumberField.swift
//  MobileNumberField
// 
//  Created by Денис Либит on 20.07.2024.
//

import Foundation
import SwiftUI


public struct MobileNumberField<Representation: View>: View {
    
    // MARK: - Инициализация
    
    public init(
        isValid: Binding<Bool>,
        phone: Binding<String>,
        country: Binding<Country> = .constant(.default),
        view: @escaping RepresentationBuilder = { DefaultRepresentation(country: $0, mask: $1, number: $2) }
    ) {
        self._isValidBinding = isValid
        self._phoneBinding = phone
        self._countryBinding = country
        self.representation = view
    }
    
    public typealias RepresentationBuilder = (_ country: Binding<Country>, _ mask: String, _ number: String) -> Representation
    
    // MARK: - Параметры
    
    @Binding
    private var isValidBinding: Bool
    
    @Binding
    private var phoneBinding: String
    
    @Binding
    private var countryBinding: Country
    
    private let representation: RepresentationBuilder
    
    // MARK: - Окружение
    
    @Environment(\.locale)
    private var locale
    
    // MARK: - Свойства
    
    @FocusState
    private var focus: Int?
    
    @State
    private var country: Country = .default
    
    @State
    private var mask: String = ""
    
    @State
    private var number: String = ""
    
    @State
    private var changeIsInternal: Bool = false
    
    // MARK: - Тело
    
    public var body: some View {
        ZStack {
            // тайное поле
            TextField("Номер телефона", text: self.$number)
                .textContentType(.telephoneNumber)
                
                #if os(iOS)
                .keyboardType(.numberPad)
                #endif
                
                .opacity(0)
                .focused(self.$focus, equals: 1)
                .frame(width: 10, height: 10)
            
            // блок номера
            self.representation(self.$country, self.mask, self.number)
                .onTapGesture {
                    // поднимаем клавиатуру по тапу
                    self.focus = 1
                }
        }
        
        .onAppear {
            // поднимаем клавиатуру при появлении
            self.focus = 1
        }
        
        // при изменении локали и начальное
        .onChange(of: self.locale, initial: true) {
            if  let identifier = self.locale.region?.identifier,
                let country = Country.countries(with: self.locale).first(where: { $0.code == identifier })
            {
                self.country = country
            }
        }
        
        // внешние воздействия и начальное значение
        .onChange(of: self.phoneBinding, initial: true) {
            // не эхо?
            if self.phoneBinding != self.country.code + self.number {
                self.process(phone: self.phoneBinding)
            }
        }
        
        // изменение страны
        .onChange(of: self.country) {
            self.process(phone: self.country.code + self.number)
        }
        
        // фильтруем пользовательский ввод
        .onChange(of: self.number) { old, new in
            if self.changeIsInternal {
                // это мы сами поменяли, не реагируем
                self.changeIsInternal = false
            } else if abs(new.count - old.count) == 1 {
                // это один символ с клавиатуры
                self.process(phone: self.country.code + new)
            } else {
                // это подстановка номера
                self.process(phone: new)
            }
        }
    }
    
    // MARK: - Инструменты
    
    private func process(phone: String) {
        // оставим только цифры
        var phone = phone.digits
        
        // найдём максимальное совпадение
        var country: Country = self.country
        var score: Int = 0
        
        for c in Country.countries(with: self.locale) {
            // попадание, и с лучшим результатом?
            if let s = c.score(for: phone) {
                // явно лучше?
                if s > score {
                    country = c
                    score = s
                } else
                
                // одинаково?
                if s == score {
                    // менее рестриктивный?
                    if c.masks.map(\.digits.count).min() ?? 0 < country.masks.map(\.digits.count).min() ?? 0 {
                        country = c
                    }
                }
            }
        }
        
        // запомним выбранную страну
        self.country = country
        
        // откусим код страны
        phone.trimPrefix(country.code.digits)
        
        // обработаем оставшийся номер
        
        // наиболее подходящая маска
        let mask: String = country.mask(for: phone)
        let limit = mask.digitsAndSlots.count
        
        // слишком длинный номер?
        if phone.count > limit {
            // обрежем
            phone.removeLast(phone.count - limit)
        }
        
        // поставим выбранную маску и номер
        self.mask = mask
        
        if phone != self.number {
            self.changeIsInternal = true
        }
        
        self.number = phone
        
        // отдадим признак валидности
        self.isValidBinding =
            self.mask.digitsAndSlots.count == self.number.count
        
        // отдадим номер
        self.phoneBinding =
            self.country.code + self.number
        
        // отдадим страну
        self.countryBinding =
            country
    }
}

// MARK: - Превьюха

#Preview {
    struct ExampleView: View {
        
        @State
        private var isValid: Bool = false
        
        @State
        private var phone: String = ""
        
        @Environment(\.locale)
        private var locale
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: self.isValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundStyle(self.isValid ? .green : .red)
                    
                    if let id = self.locale.region?.identifier, let title = self.locale.localizedString(forRegionCode: id) {
                        Text(title)
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 4)

                MobileNumberField(
                    isValid: self.$isValid,
                    phone: self.$phone
                )
                .onChange(of: self.phone) {
                    NSLog("phone: [\(self.phone)]")
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        self.button(id: "RU", number: "+7 (916) 124-62-68")
                        self.button(id: "KZ", number: "+7 (716) 124-62-68")
                        self.button(id: "JP", number: "+81 (22)1234-5678")
                        self.button(id: "MM", number: "+95 12-345-678")
                        self.button(id: "NZ", number: "+64 (123)4567-8901")
                    }
                }
            }
            #if os(iOS)
            .listRowSeparator(.hidden)
            #endif
        }
        
        @ViewBuilder
        private func button(id: String, number: String) -> some View {
            Button((Country.countries(with: self.locale).first(where: { $0.id == id }) ?? .default).flag) {
                self.phone = number
            }
        }
    }
    
    #if os(tvOS) || os(watchOS)
    return ExampleView()
        .environment(\.locale, .init(identifier: "ru_RU"))
    #else
    return List {
        ExampleView()
            .environment(\.locale, .init(identifier: "ru_RU"))
        
        ExampleView()
            .environment(\.locale, .init(identifier: "fr_TT"))
        
        ExampleView()
            .environment(\.locale, .init(identifier: "fi_FI"))
        
        ExampleView()
            .environment(\.locale, .init(identifier: "en_UK"))
        
        ExampleView()
            .environment(\.locale, .init(identifier: "fr_FR"))
        
        ExampleView()
            .environment(\.locale, .init(identifier: "ar_AR"))
    }
    .listStyle(.plain)
    .scrollDismissesKeyboard(.interactively)
    
    #if os(macOS)
    .frame(width: 350, height: 760)
    #endif
    
    #endif
}

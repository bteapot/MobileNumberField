//
//  DefaultRepresentation.swift
//  MobileNumberField
//
//  Created by Денис Либит on 04.08.2024.
//

import SwiftUI


@MainActor
public struct DefaultRepresentation: View {
    
    // MARK: - Инициализация
    
    public init(country: Binding<Country>, mask: String, number: String) {
        self._country = country
        self.mask = mask
        self.number = number
    }
    
    // MARK: - Параметры
    
    @Binding 
    private var country: Country
    
    private let mask: String
    private let number: String
    
    // MARK: - Окружение
    
    @Environment(\.locale)
    private var locale
    
    @Environment(\.isEnabled)
    private var isEnabled
    
    // MARK: - Свойства
    
    @State
    private var isChooserShown: Bool = false
    
    @State
    private var search: String = ""
    
    #if os(watchOS)
    private let fontSize: CGFloat = 12
    #else
    private let fontSize: CGFloat = 24
    #endif
    
    // MARK: - Тело
    
    public var body: some View {
        HStack(spacing: 3) {
            // флаг и код страны
            self.codeView
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 4))
            
            Divider()
            
            // номер
            Text(self.string(for: self.number, mask: self.mask))
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 8))
                .opacity(self.isEnabled ? 1 : 0.5)
        }
        .fixedSize()
        .background(
            RoundedRectangle(
                cornerRadius: 4
            )
            .fill(Color.quaternarySystemFill)
            .stroke(Color.systemFill, lineWidth: 0.5)
        )
        .contentShape(Rectangle())
    }
    
    // MARK: - Сабвьюхи
    
    @ViewBuilder
    private var codeView: some View {
        Button(
            action: {
                self.isChooserShown = true
            },
            label: {
                HStack(spacing: 3) {
                    // эмодзи флаг
                    Text(self.country.flag)
                    
                    // код страны
                    Text(self.string(for: "", mask: self.country.code))
                }
            }
        )
        .buttonStyle(.plain)
        
        // выбор страны
        .sheet(isPresented: self.$isChooserShown) {
            self.countrySelector
        }
    }
    
    @ViewBuilder
    private var countrySelector: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                List(selection: self.$country.optional) {
                    ForEach(self.countries, id: \.self) { country in
                        HStack {
                            Text(country.flag)
                            Text(country.name)
                            Spacer()
                            
                            Text(country.code)
                                .font(.footnote.monospacedDigit())
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onAppear {
                    Task { @MainActor in
                        proxy.scrollTo(self.country, anchor: .center)
                    }
                }
            }
            .navigationTitle("Страны")
            
            #if os(macOS)
            .searchable(text: self.$search, placement: .toolbar)
            #endif
            
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: self.$search, placement: .navigationBarDrawer(displayMode: .always))
            #endif
        }
        .onChange(of: self.country) {
            self.isChooserShown = false
        }
    }
    
    // MARK: - Инструменты
    
    private func string(for number: String, mask: String) -> AttributedString {
        var string = AttributedString()
        
        var number = number
        var mask = mask
        
        while mask.isEmpty == false {
            let m = mask.removeFirst()
            var attributes = AttributeContainer()
            let c: Character
            
            let af = AttributeScopes.SwiftUIAttributes.FontAttribute.self
            let ac = AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute.self
            let ak = AttributeScopes.SwiftUIAttributes.KerningAttribute.self
            
            switch m {
                case "0"..."9":
                    attributes[ac] = .primary
                    attributes[af] = .digits(size: self.fontSize)
                    
                    if number.isEmpty == false {
                        c = number.removeFirst()
                    } else {
                        c = m
                    }
                    
                case "#":
                    if number.isEmpty == false {
                        attributes[ac] = .primary
                        attributes[af] = .digits(size: self.fontSize)
                        c = number.removeFirst()
                    } else {
                        attributes[ac] = .secondary.opacity(0.25)
                        attributes[af] = .system(size: self.fontSize, weight: .medium, design: .monospaced)
                        c = "•"
                    }
                    
                case "(":
                    attributes[af] = .system(size: self.fontSize, weight: .regular)
                    attributes[ac] = .secondary
                    c = m
                    
                    if string.characters.isEmpty == false {
                        let index = string.characters.index(before: string.endIndex)
                        string[index..<string.endIndex][ak] = self.fontSize / 3
                    }
                    
                case ")":
                    attributes[af] = .system(size: self.fontSize, weight: .regular)
                    attributes[ac] = .secondary
                    c = m
                    
                    if mask.isEmpty == false {
                        attributes[ak] = self.fontSize / 3
                    }
                    
                default:
                    attributes[af] = .system(size: self.fontSize, weight: .regular)
                    attributes[ac] = .secondary
                    c = m
            }
            
            string.append(
                AttributedString(String(c), attributes: attributes)
            )
        }
        
        return string
    }
    
    private var countries: [Country] {
        let normalized: String =
            self.search
                .trimmed
                .lowercased()
        
        return Country.countries(with: self.locale)
            .filter { country in
                guard normalized.isEmpty == false else {
                    return true
                }
                
                return
                    country.name.lowercased().contains(normalized) ||
                    country.id.lowercased().contains(normalized) ||
                    ("+" + country.code).contains(normalized)
            }
            .sorted(by: { $0.name < $1.name })
    }
    
}

// MARK: - Инструменты

extension Binding {
    var optional: Binding<Value?> {
        .init(
            get: {
                self.wrappedValue
            },
            set: {
                if let newValue = $0 {
                    self.wrappedValue = newValue
                }
            }
        )
    }
}

private extension Font {
    static func digits(size: CGFloat) -> Font {
        guard let font = CTFontCreateUIFontForLanguage(.system, size, nil) else {
            return .system(size: size, weight: .medium, design: .monospaced)
        }

        let fontFeatureSettings: [CFDictionary] = [
            [   // моноширинный
                kCTFontFeatureTypeIdentifierKey:     kNumberSpacingType,
                kCTFontFeatureSelectorIdentifierKey: kMonospacedNumbersSelector
            ] as CFDictionary,
            
            [   // ноль без палочки
                kCTFontFeatureTypeIdentifierKey:     kStylisticAlternativesType,
                kCTFontFeatureSelectorIdentifierKey: kStylisticAltThreeOnSelector
            ] as CFDictionary,
            
            [   // единица без основания
                kCTFontFeatureTypeIdentifierKey:     kStylisticAlternativesType,
                kCTFontFeatureSelectorIdentifierKey: kStylisticAltFourOnSelector
            ] as CFDictionary,
        ]
        
        let fontTraits = [
            kCTFontWeightTrait: 0.2, // medium
        ] as CFDictionary
        
        let fontDescriptor = CTFontDescriptorCreateWithAttributes([
            kCTFontFeatureSettingsAttribute: fontFeatureSettings,
            kCTFontTraitsAttribute:          fontTraits,
        ] as CFDictionary)
        
        let fontWithFeatures = CTFontCreateCopyWithAttributes(font, size, nil, fontDescriptor)

        return Font(fontWithFeatures)
    }
}

#if os(macOS)
import AppKit

extension Color {
    static var systemFill:              Color { Color(NSColor.systemFill) }
    static var quaternarySystemFill:    Color { Color(NSColor.quaternarySystemFill) }
}
#endif


#if os(iOS)
import UIKit

extension Color {
    static var systemFill:              Color { Color(UIColor.systemFill) }
    static var quaternarySystemFill:    Color { Color(UIColor.quaternarySystemFill) }
}
#endif


#if os(tvOS)
import UIKit

extension Color {
    static var systemFill:              Color { Color.gray.opacity(0.5) }
    static var quaternarySystemFill:    Color { Color.gray.opacity(0.25) }
}
#endif


#if os(watchOS)
import UIKit

extension Color {
    static var systemFill:              Color { Color.gray.opacity(0.5) }
    static var quaternarySystemFill:    Color { Color.gray.opacity(0.25) }
}
#endif



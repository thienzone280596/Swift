//
//  Locale+Extensions.swift
//  BudgetApp
//
//  Created by ThienTran on 26/8/24.
//

import Foundation


extension Locale {
  static var currentcyCode:String {
    Locale.current.currency?.identifier ?? "USD"
  }
    static var preferredLanguageCode: String {
        guard let preferredLanguage = preferredLanguages.first,
              let code = Locale(identifier: preferredLanguage).language.languageCode?.identifier else {
            return "en"
        }
        return code
    }

    static var preferredLanguageCodes: [String] {
      return Locale.preferredLanguages.compactMap({Locale(identifier: $0).language.languageCode?.identifier})
    }
}

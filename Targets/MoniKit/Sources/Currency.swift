//
//  Currency.swift
//  Settings
//
//  Created by Quentin Eude on 04/12/2023.
//  Copyright © 2023 qeude. All rights reserved.
//

import Foundation

public struct Currency: Hashable {
  public let name: String
  public let code: String
  public let symbol: String
}

extension Locale {
  public func localizedCurrencySymbol(forCurrencyCode currencyCode: String) -> String? {
    guard let languageCode = language.languageCode?.identifier, let regionCode = region?.identifier else { return nil }
    
    let components: [String: String] = [
      NSLocale.Key.languageCode.rawValue: languageCode,
      NSLocale.Key.countryCode.rawValue: regionCode,
      NSLocale.Key.currencyCode.rawValue: currencyCode
    ]
    
    let identifier = Locale.identifier(fromComponents: components)
    
    return Locale(identifier: identifier).currencySymbol
  }
}

extension Currency {
  public static var currencyCodes: [String] = ["AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BOV", "BRL", "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHE", "CHF", "CHW", "CLF", "CLP", "CNY", "COP", "COU", "CRC", "CUC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "INR", "IQD", "IRR", "ISK", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MUR", "MVR", "MWK", "MXN", "MXV", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "SSP", "STD", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VND", "VUV", "WST", "XAF", "XAG", "XAU", "XBA", "XBB", "XCD", "XDR", "XFU", "XOF", "XPD", "XPF", "XPT", "YER", "ZAR", "ZMW"]

  public static var allCurrencies: [Currency] {
    let currencies: [Currency] = currencyCodes.compactMap {
      let name = Locale.current.localizedString(forCurrencyCode: $0) ?? ""
      let symbol = Locale.current.localizedCurrencySymbol(forCurrencyCode: $0) ?? ""
      return Currency(name: name, code: $0, symbol: symbol)
    }
    return currencies
  }
}

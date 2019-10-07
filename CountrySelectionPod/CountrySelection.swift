//
//  ViewController.swift
//  CountrySelectionPod
//
//  Created by Fedor Volchkov on 10/4/19.
//  Copyright © 2019 Fedor Volchkov. All rights reserved.
//

import UIKit
import CoreTelephony

class CountrySelection {
    private enum Path {
        static let countriesFile = "Countries"
        static let fileType = "json"
    }
    
    private var countries: [Country]? = []
    
    init() {
        parseCountriesList()
    }
    
    func getCountriesList() throws -> [Country] {
        guard let countries = countries else {
            throw NSError(domain: "", code: 1, userInfo: nil)
        }
        return countries
    }
    
    func getCountryFromSettings() -> Country? {
        let localeCountry = Locale.current.regionCode
        let country = countries?.first(where: { $0.alpha2Code == localeCountry })
        return country
    }
    
    func getCountryByCelluar() -> Country? {
        guard let providers = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders else { return nil }
        let isoCountryCodes = providers.compactMap { $0.value.isoCountryCode }
        return countries?.first(where: { isoCountryCodes.contains($0.alpha2Code.lowercased()) })
    }
    
    private func parseCountriesList() {
        guard let path = Bundle.main.path(forResource: Path.countriesFile, ofType: Path.fileType) else {
            print("Error with countries JSON path")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            countries = try decoder.decode([Country].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

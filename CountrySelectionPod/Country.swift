//
//  Country.swift
//  Greenlight
//
//  Created by Anton Bal on 6/13/19.
//  Copyright © 2019 Cleveroad Inc. All rights reserved.
//

import Foundation
import UIKit

public struct Country {
    public let alpha2Code: String
    public let callingCode: String
    public let name: String
    public let flag: UIImage
    
    public var formattedCallingCode: String {
        return "+\(callingCode)"
    }
}

// MARK: - Decoding

extension Country: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case alpha3Code
        case alpha2Code
        case numericCode
        case callingCode
        case flag
        case assetIcList = "ic_list_"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name        = try container.decode(String.self, forKey: .name)
        alpha2Code  = try container.decode(String.self, forKey: .alpha2Code)
        callingCode = try container.decode(String.self, forKey: .callingCode)
        flag = UIImage(named: CodingKeys.assetIcList.rawValue + alpha2Code.lowercased())!
    }
}

// MARK: - Equatable

extension Country: Equatable {
    public static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.callingCode == rhs.callingCode && lhs.alpha2Code == rhs.alpha2Code
    }
}

//
//  Account.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}

struct Account: Codable {
    
    var id: UUID
    var name: String
    var accountType: AccountType
    var balance: Double
    
//    private enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case name = "name"
//        case accountType = "accountType"
//        case balance = "balance"
//    }
}

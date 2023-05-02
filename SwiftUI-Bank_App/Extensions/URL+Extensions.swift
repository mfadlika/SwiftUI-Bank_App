//
//  URL+Extensions.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

extension URL {
    
    static func urlForAccounts() -> URL? {
        return URL(string: "\(Constants.indexURL)/api/accounts")
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string: "\(Constants.indexURL)/api/accounts")
    }
    
    static func urlForTransfer() -> URL? {
        return URL(string: "\(Constants.indexURL)/api/transfer")
    }
}

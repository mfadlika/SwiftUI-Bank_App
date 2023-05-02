//
//  CreateAccountRequest.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

struct CreateAccountRequest: Codable {
    
    let name: String
    let accountType: String
    let balance: Double
}

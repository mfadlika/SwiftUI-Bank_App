//
//  TransferFundRequest.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

struct TransferFundRequest: Codable {
    
    let accountFromId: String
    let accountToId: String
    let amount: Double
    
}

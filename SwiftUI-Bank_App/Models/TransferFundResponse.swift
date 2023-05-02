//
//  TransferFundResponse.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

struct TransferFundResponse: Decodable {
    let success: Bool
    let error: String?
}

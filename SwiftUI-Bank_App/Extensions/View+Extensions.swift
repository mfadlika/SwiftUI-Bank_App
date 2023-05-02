//
//  View+Extensions.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}

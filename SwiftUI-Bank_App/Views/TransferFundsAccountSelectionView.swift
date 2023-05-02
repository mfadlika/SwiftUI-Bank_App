//
//  TransferFundsAccountSelectionView.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 02/05/23.
//

import SwiftUI

struct TransferFundsAccountSelectionView: View {
    
    @ObservedObject var transferFundVM: TransferFundViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Button("From \(self.transferFundVM.fromAccountType)") {
                self.isFromAccount = true
                self.showSheet = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green)
            .foregroundColor(.white)
            
            Button("To \(self.transferFundVM.toAccountType)") {
                self.isFromAccount = false
                self.showSheet = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.green)
            .foregroundColor(.white)
            .opacity(self.transferFundVM.fromAccount != nil ? 1.0 : 0.5)
            .disabled(self.transferFundVM.fromAccount == nil)
            
            TextField("Amount", text: self.$transferFundVM.amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

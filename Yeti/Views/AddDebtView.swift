//
//  AddDebtView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI

struct AddDebtView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Text("Hello Add Debt")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Yeti")
                            .font(.system(size: 32, weight: .bold))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.gray)
                                .font(.system(size: 18))
                        }
                        
                    }
                }
        }
        
    }
}

#Preview {
    AddDebtView()
}

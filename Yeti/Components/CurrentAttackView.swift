//
//  CurrentAttackView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI

struct CurrentAttackView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Currently Attacking")
                .font(.system(size: 12))
                .foregroundStyle(.gray)
            Text("Chase Freedom Unlimited")
                .font(.system(size: 20, weight: .bold))
        }
    }
}

#Preview {
    CurrentAttackView()
}

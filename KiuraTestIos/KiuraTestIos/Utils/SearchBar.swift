//
//  SearchBar.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search tasks...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}


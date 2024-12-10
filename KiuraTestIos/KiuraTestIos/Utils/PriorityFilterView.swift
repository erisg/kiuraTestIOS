//
//  PriorityFilterView.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import SwiftUI

struct PriorityFilterView: View {
    @Binding var selectedPriority: TaskPriority?

    var body: some View {
        HStack {
            ForEach([TaskPriority.high, .medium, .low], id: \.self) { priority in
                Button(action: {
                    selectedPriority = (selectedPriority == priority) ? nil : priority
                }) {
                    Text(priority.rawValue.capitalized)
                        .padding()
                        .background(selectedPriority == priority ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

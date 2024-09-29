//
//  FilterView.swift
//  ToDoList
//
//  Created by Elo on 15/09/2024.
//

import SwiftUI

struct FilterView: View {
    @Binding var filterIndex: Status
    
    var body: some View {
        Picker("Filter", selection: $filterIndex) {
            ForEach(Status.allCases, id: \.self) { status in
                Text(status.rawValue).tag(status)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}



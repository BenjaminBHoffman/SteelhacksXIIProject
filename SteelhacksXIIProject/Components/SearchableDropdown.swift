//
//  SearchableDropdown.swift
//  SteelhacksXIIProject
//
//  Created by Ben Hoffman on 9/20/25.
//

import SwiftUI

struct SearchableDropdown<T: Identifiable & Hashable>: View {
    @Binding var selectedValue: String
    let placeholder: String
    let items: [T]
    let itemToString: (T) -> String
    let onItemSelected: ((T) -> Void)?
    
    @State private var showSuggestions = false
    
    // Filter items based on search text
    private var filteredItems: [T] {
        if selectedValue.isEmpty {
            return items
        } else {
            return items.filter {
                itemToString($0).lowercased().contains(selectedValue.lowercased())
            }
        }
    }
    
    init(
        selectedValue: Binding<String>,
        placeholder: String,
        items: [T],
        itemToString: @escaping (T) -> String,
        onItemSelected: ((T) -> Void)? = nil
    ) {
        self._selectedValue = selectedValue
        self.placeholder = placeholder
        self.items = items
        self.itemToString = itemToString
        self.onItemSelected = onItemSelected
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBoxView(text: $selectedValue, placeholder: placeholder)
                .onTapGesture {
                    showSuggestions = true
                }
            
            if showSuggestions && !filteredItems.isEmpty {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(filteredItems) { item in
                            Text(itemToString(item))
                                .padding(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                                .onTapGesture {
                                    selectedValue = itemToString(item)
                                    onItemSelected?(item)
                                    showSuggestions = false
                                }
                        }
                    }
                    .padding(.top, 4)
                }
                .frame(maxHeight: 200)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
        }
        .onChange(of: selectedValue) { oldValue, newValue in
            showSuggestions = !newValue.isEmpty
        }
    }
}

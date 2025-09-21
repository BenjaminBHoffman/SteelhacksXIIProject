//
//  DropdownMenu.swift
//  SteelhacksXIIProject
//
//  Created by Ben Hoffman on 9/20/25.
//
import SwiftUI

struct DropdownMenu<T: Identifiable & Hashable>: View {
    @Binding var selectedValue: String
    let placeholder: String
    let items: [T]
    let itemToString: (T) -> String
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Dropdown trigger
            HStack {
                Text(selectedValue.isEmpty ? placeholder : selectedValue)
                    .foregroundColor(selectedValue.isEmpty ? .gray : .black)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .animation(.easeInOut(duration: 0.2), value: isExpanded)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .background(Color.gray.opacity(0.15))
            .cornerRadius(10)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            
            // Dropdown list
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(items) { item in
                        Text(itemToString(item))
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .onTapGesture {
                                selectedValue = itemToString(item)
                                withAnimation {
                                    isExpanded = false
                                }
                            }
                    }
                }
                .padding(.top, 4)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
    }
}

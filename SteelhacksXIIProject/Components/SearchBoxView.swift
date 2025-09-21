//
//  SearchBoxView.swift
//  SteelhacksXIIProject
//
//  Created by Ben Hoffman on 9/20/25.
//

import SwiftUI

struct SearchBoxView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        
        HStack {
            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundStyle(Color(.black))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    SearchBoxView(text: .constant(""), placeholder: "Search...")
        .padding() // Add padding in preview to see it better
}

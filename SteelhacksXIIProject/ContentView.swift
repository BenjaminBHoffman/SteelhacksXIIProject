//
//  ContentView.swift
//  SteelhacksXIIProject
//
//  Created by Ben Hoffman on 9/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var university = ""
    @State private var housingType = ""
    @State private var address = ""
    @State private var searchResults: [HousingData] = []
    @State private var isSearching = false
    
    // Filter housing data based on user selections
    private func performSearch() {
        isSearching = true
        
        // Filter based on selected criteria
        let filteredData = HousingData.MOCK_HOUSINGDATA.filter { housing in
            let matchesUniversity = university.isEmpty || housing.university.name == university
            let matchesHousingType = housingType.isEmpty || housing.housingType.name == housingType
            let matchesAddress = address.isEmpty || housing.address.name == address || housing.address.address == address
            
            return matchesUniversity && matchesHousingType && matchesAddress
        }
        
        searchResults = filteredData
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    // University dropdown menu
                    DropdownMenu(
                        selectedValue: $university,
                        placeholder: "Select University",
                        items: University.Universities,
                        itemToString: { $0.name }
                    )
                    
                    // Housing Type dropdown menu
                    DropdownMenu(
                        selectedValue: $housingType,
                        placeholder: "Select Housing Type",
                        items: HousingType.HousingTypes,
                        itemToString: { $0.name }
                    )
                    .onChange(of: housingType) { oldValue, newValue in
                        // Clear address field when switching to On-Campus
                        if newValue == "On-Campus" {
                            address = ""
                        }
                    }
                }
                
                if housingType == "Off-Campus" {
                    // Keep address as searchable (or change to dropdown if you prefer)
                    SearchableDropdown(
                        selectedValue: $address,
                        placeholder: "Address",
                        items: Address.Addresses,
                        itemToString: { $0.name }
                    )
                }
            }
            .padding()
            
            Button {
                performSearch()
            } label: {
                HStack {
                    Text("Search")
                        .fontWeight(.semibold)
                    Image(systemName: "magnifyingglass")
                }
                .foregroundStyle(Color(.white))
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(16)
            
            Divider()
            
            if !searchResults.isEmpty {
                if searchResults.count == 1{
                    SingleHouseView(housing: searchResults[0])
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(searchResults) { housing in
                                HousingCardView(housing: housing)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

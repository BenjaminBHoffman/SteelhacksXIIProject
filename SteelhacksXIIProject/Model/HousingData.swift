//
//  HousingData.swift
//  SteelhacksXIIProject
//
//  Created by Ben Hoffman on 9/20/25.
//

import Foundation
struct HousingData: Identifiable, Hashable, Codable {
    let id: String
    let university: University
    let housingType :HousingType
    let address: Address
    var ratings: Rating
}

struct University: Identifiable, Hashable, Codable {
    let id: String
    let name: String
}
extension University {
    static var Universities: [University] = [
        .init(id: NSUUID().uuidString, name: "University of Pittsburgh"),
        .init(id: NSUUID().uuidString, name: "Penn State University"),
        .init(id: NSUUID().uuidString, name: "Ohio State University"),
        .init(id: NSUUID().uuidString, name: "West Virginia University"),
    ]
}

struct HousingType: Identifiable, Hashable, Codable {
    let id: String
    let name: String
}
extension HousingType {
    static var HousingTypes: [HousingType] = [
        .init(id: NSUUID().uuidString, name: "On-Campus"),
        .init(id: NSUUID().uuidString, name: "Off-Campus")
    ]
}

struct Address: Identifiable, Hashable, Codable {
    let id: String
    let address: String
    let name: String
    let previewImage: String
}
extension Address {
    static var Addresses: [Address] = [
        .init(id: NSUUID().uuidString, address: "313 Semple Street, Pittsburgh, PA 15213", name: "313 Semple Street", previewImage: "Charlie"),
    ]
}

struct Rating: Identifiable, Hashable, Codable {
    let id: String
    let total: Int
    let terrian: String
    let transitability: Int
    let walkability: Int
    let laundry: String
    let accessibility: String
}

//For ProfileView preview build
extension HousingData {
    static var MOCK_HOUSINGDATA: [HousingData] = [
        .init(id: NSUUID().uuidString, university: University.Universities[0], housingType: HousingType.HousingTypes[0],
              address: Address(id: NSUUID().uuidString, address: "3990 Fifth Avenue, Pittsburgh, PA 15213", name: "Litchfield Towers", previewImage: "Litchfield_Towers"),
              ratings: Rating(id: NSUUID().uuidString,
                              total: 91,
                              terrian: "Mostly Flat",
                              transitability: 5,
                              walkability: 5,
                              laundry: "In Lobby",
                              accessibility: "Yes"
                              
                             )),
        .init(id: NSUUID().uuidString, university: University.Universities[0], housingType: HousingType.HousingTypes[0],
              address: Address(id: NSUUID().uuidString, address: "3990 Fifth Avenue, Pittsburgh, PA 15213", name: "Nordenburg", previewImage: "Nordenburg"),
              ratings: Rating(id: NSUUID().uuidString,
                              total: 96,
                              terrian: "Mostly Flat",
                              transitability: 3,
                              walkability: 3,
                              laundry: "On Floor",
                              accessibility: "Yes"
                              
                             )),
        .init(id: NSUUID().uuidString, university: University.Universities[0], housingType: HousingType.HousingTypes[0],
              address: Address(id: NSUUID().uuidString, address: "3990 Fifth Avenue, Pittsburgh, PA 15213", name: "Sutherland", previewImage: "Southernland"),
              ratings: Rating(id: NSUUID().uuidString,
                              total: 60,
                              terrian: "Extremely Hilly",
                              transitability: 17,
                              walkability: 22,
                              laundry: "In Lobby",
                              accessibility: "Yes"
                              
                             )),
        .init(id: NSUUID().uuidString, university: University.Universities[0], housingType: HousingType.HousingTypes[0],
              address: Address(id: NSUUID().uuidString, address: "3990 Fifth Avenue, Pittsburgh, PA 15213", name: "Lothrob", previewImage: "Lothrob"),
              ratings: Rating(id: NSUUID().uuidString,
                              total: 73,
                              terrian: "Hilly",
                              transitability: 8,
                              walkability: 11,
                              laundry: "In Lobby",
                              accessibility: "Yes"
                              
                             )),
        .init(id: NSUUID().uuidString, university: University.Universities[0], housingType: HousingType.HousingTypes[0],
              address: Address(id: NSUUID().uuidString, address: "3990 Fifth Avenue, Pittsburgh, PA 15213", name: "Bouquet Gardens", previewImage: "Bouquet"),
              ratings: Rating(id: NSUUID().uuidString,
                              total: 91,
                              terrian: "Mostly Flat",
                              transitability: 6,
                              walkability: 6,
                              laundry: "On Floor",
                              accessibility: "Yes"
                              
                             )),
        .init(id: NSUUID().uuidString, university: University.Universities[0], housingType: HousingType.HousingTypes[1], address: Address.Addresses[0],
                                      ratings: Rating(id: NSUUID().uuidString,
                                                      total: 40,
                                                      terrian: "Mostly Flat",
                                                      transitability: 13,
                                                      walkability: 13,
                                                      laundry: "In Unit",
                                                      accessibility: "No"
                                                      
                                                     )),
    ]
}

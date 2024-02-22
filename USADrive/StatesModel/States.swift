//
//  States.swift
//  USADrive
//
//  Created by AV on 2/17/24.
//

import SwiftUI

//MARK: State Model

struct USState: Identifiable {
    var id = UUID().uuidString
    var name: String
    var shortForm: String
    // Пример: imageName = "alabama" для штата Alabama
    var imageName: String
}

var usstates: [USState] = [
    USState(name: "Alabama", shortForm: "AL", imageName: "AL"),
    USState(name: "Alaska", shortForm: "AK", imageName: "AK"),
    USState(name: "Arizona", shortForm: "AZ", imageName: "AZ"),
    USState(name: "Arkansas", shortForm: "AR", imageName: "AR"),
    USState(name: "California", shortForm: "CA", imageName: "CA"),
    USState(name: "Colorado", shortForm: "CO", imageName: "CO"),
    USState(name: "Connecticut", shortForm: "CT", imageName: "CT"),
    USState(name: "Delaware", shortForm: "DE", imageName: "DE"),
    USState(name: "District of Columbia", shortForm: "DС", imageName: "DС"),
    USState(name: "Florida", shortForm: "FL", imageName: "FL"),
    USState(name: "Georgia", shortForm: "GA", imageName: "GA"),
    USState(name: "Hawaii", shortForm: "HI", imageName: "HI"),
    USState(name: "Idaho", shortForm: "ID", imageName: "ID"),
    USState(name: "Illinois", shortForm: "IL", imageName: "IL"),
    USState(name: "Indiana", shortForm: "IN", imageName: "IN"),
    USState(name: "Iowa", shortForm: "IA", imageName: "IA"),
    USState(name: "Kansas", shortForm: "KS", imageName: "KS"),
    USState(name: "Kentucky", shortForm: "KY", imageName: "KY"),
    USState(name: "Louisiana", shortForm: "LA", imageName: "LA"),
    USState(name: "Maine", shortForm: "ME", imageName: "ME"),
    USState(name: "Maryland", shortForm: "MD", imageName: "MD"),
    USState(name: "Massachusetts", shortForm: "MA", imageName: "MA"),
    USState(name: "Michigan", shortForm: "MI", imageName: "MI"),
    USState(name: "Minnesota", shortForm: "MN", imageName: "MN"),
    USState(name: "Mississippi", shortForm: "MS", imageName: "MS"),
    USState(name: "Missouri", shortForm: "MO", imageName: "MO"),
    USState(name: "Montana", shortForm: "MT", imageName: "MT"),
    USState(name: "Nebraska", shortForm: "NE", imageName: "NE"),
    USState(name: "Nevada", shortForm: "NV", imageName: "NV"),
    USState(name: "New Hampshire", shortForm: "NH", imageName: "NH"),
    USState(name: "New Jersey", shortForm: "NJ", imageName: "NJ"),
    USState(name: "New Mexico", shortForm: "NM", imageName: "NM"),
    USState(name: "New York", shortForm: "NY", imageName: "NY"),
    USState(name: "North Carolina", shortForm: "NC", imageName: "NC"),
    USState(name: "North Dakota", shortForm: "ND", imageName: "ND"),
    USState(name: "Ohio", shortForm: "OH", imageName: "OH"),
    USState(name: "Oklahoma", shortForm: "OK", imageName: "OK"),
    USState(name: "Oregon", shortForm: "OR", imageName: "OR"),
    USState(name: "Pennsylvania", shortForm: "PA", imageName: "PA"),
    USState(name: "Rhode Island", shortForm: "RI", imageName: "RI"),
    USState(name: "South Carolina", shortForm: "SC", imageName: "SC"),
    USState(name: "South Dakota", shortForm: "SD", imageName: "SD"),
    USState(name: "Tennessee", shortForm: "TN", imageName: "TN"),
    USState(name: "Texas", shortForm: "TX", imageName: "TX"),
    USState(name: "Utah", shortForm: "UT", imageName: "UT"),
    USState(name: "Vermont", shortForm: "VT", imageName: "VT"),
    USState(name: "Virginia", shortForm: "VA", imageName: "VA"),
    USState(name: "Washington", shortForm: "WA", imageName: "WA"),
    USState(name: "West Virginia", shortForm: "WV", imageName: "WV"),
    USState(name: "Wisconsin", shortForm: "WI", imageName: "WI"),
    USState(name: "Wyoming", shortForm: "WY", imageName: "WY")
]

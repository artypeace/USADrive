//
//  States.swift
//  USADrive
//
//  Created by AV on 2/17/24.
//

import SwiftUI
import MapKit

//MARK: State Model

//struct USState: Identifiable {
//    var id = UUID().uuidString
//    var name: String
//    var shortForm: String
//    var imageName: String
//}

struct USState: Identifiable {
    var id = UUID().uuidString
    var name: String
    var imageName: String
    var centerCoordinate: CLLocationCoordinate2D
    var span: MKCoordinateSpan
}




var states: [USState] = [
    USState(
        name: "Alabama",
        imageName: "AL",
        centerCoordinate: CLLocationCoordinate2D(latitude: 32.806671, longitude: -86.791130),
        span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
    ),
    USState(
        name: "Alaska",
        imageName: "AK",
        centerCoordinate: CLLocationCoordinate2D(latitude: 61.370716, longitude: -152.404419),
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
    ),
    USState(
        name: "Arizona",
        imageName: "AZ",
        centerCoordinate: CLLocationCoordinate2D(latitude: 33.729759, longitude: -111.431221),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Arkansas",
        imageName: "AR",
        centerCoordinate: CLLocationCoordinate2D(latitude: 34.969704, longitude: -92.373123),
        span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
    ),
    USState(
        name: "California",
        imageName: "CA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 36.116203, longitude: -119.681564),
        span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)
    ),
    USState(
        name: "Colorado",
        imageName: "CO",
        centerCoordinate: CLLocationCoordinate2D(latitude: 39.059811, longitude: -105.311104),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
    ),
    USState(
        name: "Connecticut",
        imageName: "CT",
        centerCoordinate: CLLocationCoordinate2D(latitude: 41.597782, longitude: -72.755371),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    ),
    USState(
        name: "Delaware",
        imageName: "DE",
        centerCoordinate: CLLocationCoordinate2D(latitude: 39.318523, longitude: -75.507141),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    ),
    USState(
        name: "District of Columbia",
        imageName: "District",
        centerCoordinate: CLLocationCoordinate2D(latitude: 38.897438, longitude: -77.026817),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    ),
    USState(
        name: "Florida",
        imageName: "FL",
        centerCoordinate: CLLocationCoordinate2D(latitude: 27.766279, longitude: -81.686783),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
    ),
    USState(
        name: "Georgia",
        imageName: "GA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 33.040619, longitude: -83.643074),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Hawaii",
        imageName: "HI",
        centerCoordinate: CLLocationCoordinate2D(latitude: 21.094318, longitude: -157.498337),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    ),
    USState(
        name: "Idaho",
        imageName: "ID",
        centerCoordinate: CLLocationCoordinate2D(latitude: 44.240459, longitude: -114.478828),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
    ),
    USState(
        name: "Illinois",
        imageName: "IL",
        centerCoordinate: CLLocationCoordinate2D(latitude: 40.349457, longitude: -88.986137),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Indiana",
        imageName: "IN",
        centerCoordinate: CLLocationCoordinate2D(latitude: 39.849426, longitude: -86.258278),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Iowa",
        imageName: "IA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 42.011539, longitude: -93.210526),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Kansas",
        imageName: "KS",
        centerCoordinate: CLLocationCoordinate2D(latitude: 38.526600, longitude: -96.726486),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Kentucky",
        imageName: "KY",
        centerCoordinate: CLLocationCoordinate2D(latitude: 37.668140, longitude: -84.670067),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Louisiana",
        imageName: "LA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 31.169546, longitude: -91.867805),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Maine",
        imageName: "ME",
        centerCoordinate: CLLocationCoordinate2D(latitude: 44.693947, longitude: -69.381927),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Maryland",
        imageName: "MD",
        centerCoordinate: CLLocationCoordinate2D(latitude: 39.063946, longitude: -76.802101),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    ),
    USState(
        name: "Massachusetts",
        imageName: "MA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 42.230171, longitude: -71.530106),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    ),
    USState(
        name: "Michigan",
        imageName: "MI",
        centerCoordinate: CLLocationCoordinate2D(latitude: 43.326618, longitude: -84.536095),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Minnesota",
        imageName: "MN",
        centerCoordinate: CLLocationCoordinate2D(latitude: 45.694454, longitude: -93.900192),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Mississippi",
        imageName: "MS",
        centerCoordinate: CLLocationCoordinate2D(latitude: 32.741646, longitude: -89.678696),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Missouri",
        imageName: "MO",
        centerCoordinate: CLLocationCoordinate2D(latitude: 38.456085, longitude: -92.288368),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Montana",
        imageName: "MT",
        centerCoordinate: CLLocationCoordinate2D(latitude: 46.921925, longitude: -110.454353),
        span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)
    ),
    USState(
        name: "Nebraska",
        imageName: "NE",
        centerCoordinate: CLLocationCoordinate2D(latitude: 41.125370, longitude: -98.268082),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Nevada",
        imageName: "NV",
        centerCoordinate: CLLocationCoordinate2D(latitude: 38.313515, longitude: -117.055374),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
    ),
    USState(
        name: "New Hampshire",
        imageName: "NH",
        centerCoordinate: CLLocationCoordinate2D(latitude: 43.452492, longitude: -71.563896),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    ),

    USState(
        name: "New Jersey",
        imageName: "NJ",
        centerCoordinate: CLLocationCoordinate2D(latitude: 40.298904, longitude: -74.521011),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    ),
    USState(
        name: "New Mexico",
        imageName: "NM",
        centerCoordinate: CLLocationCoordinate2D(latitude: 34.840515, longitude: -106.248482),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "New York",
        imageName: "NY",
        centerCoordinate: CLLocationCoordinate2D(latitude: 42.165726, longitude: -74.948051),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "North Carolina",
        imageName: "NC",
        centerCoordinate: CLLocationCoordinate2D(latitude: 35.630066, longitude: -79.806419),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "North Dakota",
        imageName: "ND",
        centerCoordinate: CLLocationCoordinate2D(latitude: 47.528912, longitude: -99.784012),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Ohio",
        imageName: "OH",
        centerCoordinate: CLLocationCoordinate2D(latitude: 40.388783, longitude: -82.764915),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Oklahoma",
        imageName: "OK",
        centerCoordinate: CLLocationCoordinate2D(latitude: 35.565342, longitude: -96.928917),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Oregon",
        imageName: "OR",
        centerCoordinate: CLLocationCoordinate2D(latitude: 44.572021, longitude: -122.070938),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Pennsylvania",
        imageName: "PA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 40.590752, longitude: -77.209755),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "Rhode Island",
        imageName: "RI",
        centerCoordinate: CLLocationCoordinate2D(latitude: 41.680893, longitude: -71.511780),
        span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
    ),
    USState(
        name: "South Carolina",
        imageName: "SC",
        centerCoordinate: CLLocationCoordinate2D(latitude: 33.856892, longitude: -80.945007),
        span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4)
    ),
    USState(
        name: "South Dakota",
        imageName: "SD",
        centerCoordinate: CLLocationCoordinate2D(latitude: 44.299782, longitude: -99.438828),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Tennessee",
        imageName: "TN",
        centerCoordinate: CLLocationCoordinate2D(latitude: 35.747845, longitude: -86.692345),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Texas",
        imageName: "TX",
        centerCoordinate: CLLocationCoordinate2D(latitude: 31.054487, longitude: -97.563461),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    ),
    USState(
        name: "Utah",
        imageName: "UT",
        centerCoordinate: CLLocationCoordinate2D(latitude: 40.150032, longitude: -111.862434),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "Vermont",
        imageName: "VT",
        centerCoordinate: CLLocationCoordinate2D(latitude: 44.045876, longitude: -72.710686),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    ),
    USState(
        name: "Virginia",
        imageName: "VA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 37.769337, longitude: -78.169968),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Washington",
        imageName: "WA",
        centerCoordinate: CLLocationCoordinate2D(latitude: 47.400902, longitude: -121.490494),
        span: MKCoordinateSpan(latitudeDelta: 6, longitudeDelta: 6)
    ),
    USState(
        name: "West Virginia",
        imageName: "WV",
        centerCoordinate: CLLocationCoordinate2D(latitude: 38.491226, longitude: -80.954570),
        span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
    ),
    USState(
        name: "Wisconsin",
        imageName: "WI",
        centerCoordinate: CLLocationCoordinate2D(latitude: 44.268543, longitude: -89.616508),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    ),
    USState(
        name: "Wyoming",
        imageName: "WY",
        centerCoordinate: CLLocationCoordinate2D(latitude: 42.755966, longitude: -107.302490),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
    )

    
]


//var states: [USState] = [
//    USState(name: "Alabama", shortForm: "AL", imageName: "AL"),
//    USState(name: "Alaska", shortForm: "AK", imageName: "AK"),
//    USState(name: "Arizona", shortForm: "AZ", imageName: "AZ"),
//    USState(name: "Arkansas", shortForm: "AR", imageName: "AR"),
//    USState(name: "California", shortForm: "CA", imageName: "CA"),
//    USState(name: "Colorado", shortForm: "CO", imageName: "CO"),
//    USState(name: "Connecticut", shortForm: "CT", imageName: "CT"),
//    USState(name: "Delaware", shortForm: "DE", imageName: "DE"),
//    USState(name: "District of Columbia", shortForm: "DС", imageName: "District"),
//    USState(name: "Florida", shortForm: "FL", imageName: "FL"),
//    USState(name: "Georgia", shortForm: "GA", imageName: "GA"),
//    USState(name: "Hawaii", shortForm: "HI", imageName: "HI"),
//    USState(name: "Idaho", shortForm: "ID", imageName: "ID"),
//    USState(name: "Illinois", shortForm: "IL", imageName: "IL"),
//    USState(name: "Indiana", shortForm: "IN", imageName: "IN"),
//    USState(name: "Iowa", shortForm: "IA", imageName: "IA"),
//    USState(name: "Kansas", shortForm: "KS", imageName: "KS"),
//    USState(name: "Kentucky", shortForm: "KY", imageName: "KY"),
//    USState(name: "Louisiana", shortForm: "LA", imageName: "LA"),
//    USState(name: "Maine", shortForm: "ME", imageName: "ME"),
//    USState(name: "Maryland", shortForm: "MD", imageName: "MD"),
//    USState(name: "Massachusetts", shortForm: "MA", imageName: "MA"),
//    USState(name: "Michigan", shortForm: "MI", imageName: "MI"),
//    USState(name: "Minnesota", shortForm: "MN", imageName: "MN"),
//    USState(name: "Mississippi", shortForm: "MS", imageName: "MS"),
//    USState(name: "Missouri", shortForm: "MO", imageName: "MO"),
//    USState(name: "Montana", shortForm: "MT", imageName: "MT"),
//    USState(name: "Nebraska", shortForm: "NE", imageName: "NE"),
//    USState(name: "Nevada", shortForm: "NV", imageName: "NV"),
//    USState(name: "New Hampshire", shortForm: "NH", imageName: "NH"),
//    USState(name: "New Jersey", shortForm: "NJ", imageName: "NJ"),
//    USState(name: "New Mexico", shortForm: "NM", imageName: "NM"),
//    USState(name: "New York", shortForm: "NY", imageName: "NY"),
//    USState(name: "North Carolina", shortForm: "NC", imageName: "NC"),
//    USState(name: "North Dakota", shortForm: "ND", imageName: "ND"),
//    USState(name: "Ohio", shortForm: "OH", imageName: "OH"),
//    USState(name: "Oklahoma", shortForm: "OK", imageName: "OK"),
//    USState(name: "Oregon", shortForm: "OR", imageName: "OR"),
//    USState(name: "Pennsylvania", shortForm: "PA", imageName: "PA"),
//    USState(name: "Rhode Island", shortForm: "RI", imageName: "RI"),
//    USState(name: "South Carolina", shortForm: "SC", imageName: "SC"),
//    USState(name: "South Dakota", shortForm: "SD", imageName: "SD"),
//    USState(name: "Tennessee", shortForm: "TN", imageName: "TN"),
//    USState(name: "Texas", shortForm: "TX", imageName: "TX"),
//    USState(name: "Utah", shortForm: "UT", imageName: "UT"),
//    USState(name: "Vermont", shortForm: "VT", imageName: "VT"),
//    USState(name: "Virginia", shortForm: "VA", imageName: "VA"),
//    USState(name: "Washington", shortForm: "WA", imageName: "WA"),
//    USState(name: "West Virginia", shortForm: "WV", imageName: "WV"),
//    USState(name: "Wisconsin", shortForm: "WI", imageName: "WI"),
//    USState(name: "Wyoming", shortForm: "WY", imageName: "WY")
//]

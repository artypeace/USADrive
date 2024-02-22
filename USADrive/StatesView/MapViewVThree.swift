////
////  MapViewVThree.swift
////  USADrive
////
////  Created by AV on 2/19/24.
////
//
import SwiftUI
import MapKit



struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
    )

    var body: some View {
        Map(coordinateRegion: $region)
    }
}


// BottomSheetView для отображения и фильтрации списка штатов
struct BottomSheetView: View {
    @Binding var searchText: String
    var states: [USState]

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 5)
                .foregroundColor(.gray)
                .padding()

            TextField("Search your State", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            ScrollView {
                ForEach(states.filter { searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased()) }) { state in
                    HStack {
                        Image(state.imageName) // Изображения должны быть в Assets.xcassets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 20)
                        Text(state.name)
                        Spacer()
                        Text(state.shortForm)
                    }
                    .padding()
                }
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxHeight: 400)
        .padding()
    }
}

struct MapViewVThree: View {
    
    @State private var searchText = ""

       var body: some View {
           ZStack(alignment: .top) {
               MapView()
               
               BottomSheetView(searchText: $searchText, states: usstates)
                   .padding(.horizontal)
                   .frame(maxHeight: 400)
                   .background(Color.white)
                   .cornerRadius(20)
                   .padding(.top, 44)
           }
       }
    
}

#Preview {
    MapViewVThree()
}

//
//  USAMapView.swift
//  USADrive
//
//  Created by AV on 2/17/24.
//

import SwiftUI
import MapKit

struct USAMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
    )
    @State private var searchText = ""
    @State private var mapType: MKMapType = .satellite // Изначальный стиль карты
    @State private var showSheet = true
    
    
    var filteredStates: [USState] {
        if searchText.isEmpty {
            return usstates
        } else {
            return usstates.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.shortForm.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: .all)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
//                bottomSheet
                    .sheet(isPresented: $showSheet) {
                        VStack {
                            Text("Choose your State")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                            
                            TextField("Search your State", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()

                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(filteredStates) { state in
                                    HStack {
                                        Image(state.imageName) // Убедитесь, что у вас есть изображения флагов штатов в Assets
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 20)
                                        Text(state.name)
                                        Spacer()
                                        Text(state.shortForm)
                                    }
                                    .padding()
                                    .onTapGesture {
                                        // TODO: Реализуйте переход на другой экран с деталями выбранного штата
                                        print("Выбран штат: \(state.name)")
                                    }
                                }
                            }
                        }
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                        .frame(maxHeight: 400)
                        .padding()
                        .presentationDetents([.height(300)])

//                        .presentationDetents([.fraction(0.15),.medium, .large,])
                    }
                
            }.edgesIgnoringSafeArea(.bottom)
        }
    }

    var bottomSheet: some View {
        VStack {
            Text("Choose your State")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            TextField("Search your State", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(filteredStates) { state in
                    HStack {
                        Image(state.imageName) // Убедитесь, что у вас есть изображения флагов штатов в Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 20)
                        Text(state.name)
                        Spacer()
                        Text(state.shortForm)
                    }
                    .padding()
                    .onTapGesture {
                        // TODO: Реализуйте переход на другой экран с деталями выбранного штата
                        print("Выбран штат: \(state.name)")
                    }
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
        .frame(maxHeight: 400)
        .padding()
    }
}
struct USAMapView_Previews: PreviewProvider {
    static var previews: some View {
        USAMapView()
    }
}

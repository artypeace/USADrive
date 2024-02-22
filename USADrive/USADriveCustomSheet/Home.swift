//
//  Home.swift
//  USADrive
//
//  Created by AV on 2/18/24.
//

//import SwiftUI
//import MapKit
//
//struct Home: View {
//    
//    
//    @State private var searchText = ""
//    @State private var region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
//            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
//        )
//  
//    
//    var filteredStates: [USState] {
//        if searchText.isEmpty {
//            return states
//        } else {
//            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.shortForm.lowercased().contains(searchText.lowercased()) }
//        }
//    }
//    
//    
//    var body: some View {
//        ZStack{
//            //MARK: Sample Coordinate Region
//            
//            Map(coordinateRegion: $region, interactionModes: .all)
//                    .ignoresSafeArea()
////                .overlay(alignment: .topTrailing, content: {
////                    Button {
////                        
////                    } label: {
////                        Image(systemName: "map")
////                            .font(.title2)
////                    }
////                    .padding()
////                })
//            //MARK: Building sheet
//            //                .sheet(isPresented: .constant(true)) {
//            ////                    VStack {
//            ////                        Text("Choose your State")
//            ////                            .fontDesign(.monospaced)
//            //////                            .font(.headline)
//            ////                            .frame(maxWidth: .infinity, alignment: .leading)
//            //////                            .padding(.top)
//            ////                            .padding(.leading)
//            ////
//            ////                        TextField("Search your State", text: $searchText)
//            ////                            .textFieldStyle(RoundedBorderTextFieldStyle())
//            ////                            .padding()
//            ////
//            ////                        ScrollView(.vertical, showsIndicators: false) {
//            ////                            ForEach(filteredStates) { state in
//            ////                                HStack {
//            ////                                    Image(state.imageName) // Убедитесь, что у вас есть изображения флагов штатов в Assets
//            ////                                        .resizable()
//            ////                                        .scaledToFit()
//            ////                                        .frame(width: 30, height: 20)
//            ////                                    Text(state.name)
//            ////                                    Spacer()
//            ////                                    Text(state.shortForm)
//            ////                                }
//            ////                                .padding()
//            ////                                .onTapGesture {
//            ////                                    // TODO: Реализуйте переход на другой экран с деталями выбранного штата
//            ////                                    print("Выбран штат: \(state.name)")
//            ////                                }
//            ////                            }
//            ////                        }
//            ////                    }
//            //                    StatesList()
//            //                    .padding()
//            //                    .padding(.top)
//            //                }
//                //Since we always need bottom sheet at bottom setting to try by default
//                .bottomSheet(presentationDetents: [.medium, .large, .height(120)], isPresented: .constant(true), sheetCornerRadius: 20) {
//                    StatesList()
//                } onDismiss: {}
//
//        }
//    }
//    @ViewBuilder
//    func StatesList()->some View{
//        VStack {
//            Text("Choose your State")
//                .fontDesign(.monospaced)
////                            .font(.headline)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.top)
//                .padding(.leading)
//            
//            TextField("Search your State", text: $searchText)
////                .textFieldStyle(RoundedBorderTextFieldStyle())
////                .padding()
//                .padding(.vertical, 10)
//                .padding(.horizontal)
//                .background {
//                    RoundedRectangle(cornerRadius: 10, style: .continuous)
//                        .fill(.ultraThickMaterial)
//                }
//            
//            //States List View
//            
//
//            ScrollView(.vertical, showsIndicators: false) {
//                ForEach(filteredStates) { state in
//                    HStack {
//                        Image(state.imageName) // Убедитесь, что у вас есть изображения флагов штатов в Assets
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 20)
//                        Text(state.name)
//                        Spacer()
//                        Text(state.shortForm)
//                    }
//                    .padding()
//                    .onTapGesture {
//                        // TODO: Реализуйте переход на другой экран с деталями выбранного штата
//                        print("Выбран штат: \(state.name)")
//                    }
//                }
//            }
//            .padding(.top, 15)
//        }
//    }
//}
//
//
//#Preview {
//    Home()
//}

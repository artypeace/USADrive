//
//  HomeView.swift
//  USADrive
//
//  Created by AV on 2/22/24.
//

//import SwiftUI
//import MapKit
//
//struct HomeView: View {
//    
//    @State private var region = MapCameraPosition.region(MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
//        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
//    ))
//    
//    @State var searchText = ""
//    @State var showCancelButton = false
//    
//    @State var isShowingBottomSheet = true
////    @State var offset: CGFloat = 0
////    @State var lastOffset: CGFloat = 0
////    @GestureState var gestureOffset: CGFloat = 0
//    
//    var filteredStates: [USState] {
//        if searchText.isEmpty {
//            return states
//        } else {
//            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) }
//        }
//    }
//    
//    
//    var body: some View {
//        ZStack {
//            VStack {
//                Map(position: $region)
//                    .ignoresSafeArea(edges: .top)
//                    .frame(height: 650)
//                    .onTapGesture {
//                        withAnimation {
//                            isShowingBottomSheet = true
//                        }
//                    }
//
//            
//                Spacer()
//            }
//            
//            .sheet(isPresented: $isShowingBottomSheet) {
//                VStack {
//                    VStack {
//                        HStack {
//                            HStack {
//                                TextField("\(Image(systemName: "magnifyingglass")) Search your State", text: $searchText)
//                                    .onTapGesture {
//                                        withAnimation {
//                                            showCancelButton = true
//                                        }
//                                    }
//                                
//                            }
//                            .padding(.vertical, 10)
//                            .padding(.horizontal, 10)
////                            .background {
////                                RoundedRectangle(cornerRadius: 10, style: .continuous)
////                                .fill(.ultraThickMaterial)}
//                            .background(BlurView(blurStyle: .regular))
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                            
//                            if showCancelButton {
//                                Button("cancel", action: {
//                                    hideKeyboard()
//                                    searchText = ""
//                                    withAnimation {
//                                        showCancelButton = false
//                                    }
//                                })
//                            }
//                        }
//                    } .padding(.top, 20)
//                        .padding(.horizontal, 20)
//                
//                List {
//                    ForEach(filteredStates) { state in
//                        HStack {
//                            Image(state.imageName)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 34, height: 30)
//                            Text(state.name)
//                                .font(.title)
//                            Spacer()
//                            Text(state.shortForm)
//                        }
//                        .padding()
//                        .onTapGesture {
//                            // TODO: Реализуйте переход на другой экран с деталями выбранного штата
//                            print("Выбран штат: \(state.name)")
//                        }
//                    }
//                }
//                .background(BlurView(blurStyle: .systemThinMaterial))
////                .scrollContentBackground(.hidden)
//                .listStyle(.plain)
//            }
////                .background(Color.gray)
////                .background(BlurView(style: .systemThickMaterial))
//                    .presentationDetents([.medium, .large, .height(100)])
//                    .presentationDragIndicator(.visible)
//                    .presentationBackgroundInteraction(
//                        .enabled(upThrough: .medium)
//                    )
//            }
////            .presentationBackground(.thinMaterial)
////            .presentationCornerRadius(30)
//        
//
//        }
//    }
//    
//    
//    
//}
//
//#Preview {
//    HomeView()
//}
//
//extension View {
//    func hideKeyboard() {
//        UIApplication.shared.sendAction(
//            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}

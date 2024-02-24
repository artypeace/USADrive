//
//  HomeView.swift
//  USADrive
//
//  Created by AV on 2/22/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var region = MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
                span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
            ))
    
    @State var searchText = ""
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    var filteredStates: [USState] {
        if searchText.isEmpty {
            return states
        } else {
            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.shortForm.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                Map(position: $region)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 350)
                Image("CA")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 4)
                    )
                    .shadow(radius: 7)
                    .offset(y: -130)
                    .padding(.bottom, -113)
                
                VStack {
                    Text("California")
                        .font(.system(size: 35, weight: .bold))
                        .padding(8)
                    
                    Text("Your State")
                        .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.gray)
                }
                .padding(8)
                .padding(.bottom, 30)
                Spacer()
            }
            
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                return AnyView (
                
                    ZStack {
                        BlurView(style: .systemMaterialDark)
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30))
                        VStack {
                            VStack {
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width: 60, height: 4)
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    TextField("Search your state", text: $searchText)
                                      
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(BlurView(style: .dark))
                            
                                .cornerRadius(10) //TODO: change .cornerRadius (it will be deprecated to clipShape()
                                .preferredColorScheme(.dark)
                                .padding(.top, 10)
                                
                            }
                            .frame(height: 100)
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                BottomSheet(searchText: $searchText)
                                    .padding(.bottom)
                                    .padding(.bottom, offset == -((height - 100) / 3) ? ((height - 100) / 1.5) : 0)
                                    .preferredColorScheme(.dark) //
                                    .padding(.top, 10) 
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                        .offset(y: height - 100)
                        .offset(y: -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0)
                        .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
                            out = value.translation.height
                            onChange()
                        }).onEnded({ value in
                                let maxHeight = height - 100
                            withAnimation {
                                if -offset > 100 && -offset < maxHeight / 2 {
                                    offset = -(maxHeight / 3)
                                }else if -offset > maxHeight / 2 {
                                    offset = -maxHeight
                                }
                                else {
                                    offset = 0
                                }
                            }
                            lastOffset = offset
                    }))
                )
            }
        }
    }
    
    func onChange() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    func getBlurRadius() -> CGFloat {
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        return progress * 30 <= 30 ? progress * 30 : 30
    }
    
}

#Preview {
    HomeView()
}

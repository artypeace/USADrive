
//  Home.swift
//  USADrive
//
//  Created by AV on 2/18/24.
//
//
import SwiftUI
import MapKit

struct Home: View {
    
    @State private var region = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
    ))
    
    @State var searchText = ""
    @State var showCancelButton = false
    @State var isShowingBottomSheet = true
    @State private var isHybridMap: Bool = false
    @State private var topButtonImageName: String = "map.fill"
    
    
    var filteredStates: [USState] {
        if searchText.isEmpty {
            return states
        } else {
            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.shortForm.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    var body: some View {
        ZStack{
            VStack {
                Map(position: $region)
                    .mapStyle(isHybridMap ? .hybrid : .standard)
//                    .mapStyle(.standard(elevation: .realistic))
//                    .mapStyle(.hybrid(elevation: .realistic))
                    .ignoresSafeArea(edges: .top)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0))
                    .onTapGesture {
                        withAnimation {
                            isShowingBottomSheet = true
                        }
                    }
                    .overlay(alignment: .topTrailing, content: {
                        DoubleButton(
                            topButtonImageName: topButtonImageName,
                            bottomButtonImageName: "location"
                        ) { tappedButton in
                            switch tappedButton {
                            case .top:
                                toggleMapStyle()
                            case .bottom:
                                print("Bottom button tapped")
                            }
                        }
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                    })
                
            }
            
            .bottomSheet(presentationDetents: [.medium, .large, .height(120)], isPresented: .constant(true), sheetCornerRadius: 10, isTransparentBG: true) {
                StatesList()
                    .background(content: {
                        Rectangle()
                            .fill(.thinMaterial)
                            .ignoresSafeArea()
                    })
            } onDismiss: {}
            
        }
    }
    
    func toggleMapStyle() {
           isHybridMap.toggle()
           topButtonImageName = isHybridMap ? "globe.americas.fill" : "map.fill"
       }
    
    
    @ViewBuilder
    func StatesList()->some View{
        VStack {
            HStack {
                HStack {
                    TextField("\(Image(systemName: "magnifyingglass")) Search your State", text: $searchText)
                        .font(.title2)
                        .onTapGesture {
                            withAnimation {
                                showCancelButton = true
                            }
                        }
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.ultraThickMaterial)}
                
                if showCancelButton {
                    Button("cancel", action: {
                        hideKeyboard()
                        searchText = ""
                        withAnimation {
                            showCancelButton = false
                        }
                    })
                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        
        VStack {
            //States List View
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(filteredStates) { state in
                    HStack {
                        Image(state.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 40)
                        Text(state.name)
                            .font(.title)
                        Spacer()
                        Text(state.shortForm)
                    }
                    .padding()
                    
//                    if state != filteredStates.last {
//                        Divider()
//                    }
                    
                    .onTapGesture {
                        // TODO: Реализуйте переход на другой экран с деталями выбранного штата
                        print("Выбран штат: \(state.name)")
                    }
                    
                }
            }
            //            .padding(.top, 15)
        }
    }
    
}


struct DoubleButton: View {
    var topButtonImageName: String
    var bottomButtonImageName: String

    var buttonTapped: (ButtonType) -> ()

    enum ButtonType {
        case top
        case bottom
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            button(buttonType: .top, imageName: topButtonImageName)
            Color.gray.frame(height: 0.4)
            button(buttonType: .bottom, imageName: bottomButtonImageName)
            }
        .frame(width: 44.0, height: 88.0)
            .background {
                Color(UIColor.secondarySystemBackground)
                    .cornerRadius(10.0)
                    .shadow(color: .gray, radius:1, x: 0.0, y: 0.0)
            }
        }

    func button(buttonType: ButtonType, imageName: String) -> some View {
        return Button(action: {
            buttonTapped(buttonType)
        }, label: {
            Image(systemName: imageName)
                .font(.system(size: 20))
        })
        .padding(10)
        .foregroundColor(Color(UIColor.secondaryLabel))
    }
}




#Preview {
    Home()
}

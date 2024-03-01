
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
            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    var body: some View {
        ZStack{
            VStack {
                Map(position: $region)
                    .mapStyle(isHybridMap ? .hybrid : .standard)
                    .ignoresSafeArea(edges: .top)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 220, trailing: 0))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
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
            
            .bottomSheet(presentationDetents: [.medium, .large, .height(220)], isPresented: .constant(true), sheetCornerRadius: 10, isTransparentBG: true) {
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
                            let impactHeavy = UIImpactFeedbackGenerator(style: .light)
                                impactHeavy.impactOccurred()
                        }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.ultraThickMaterial)}
                
                if showCancelButton {
                    Button("cancel", action: {
//                        hideKeyboard()
//                        searchText = ""
                        withAnimation {
                            hideKeyboard()
                            searchText = ""
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
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(filteredStates) { state in
                    VStack(spacing: 0) {
                        HStack {
                            Image(state.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60,height: 38)
                                .clipShape(RoundedRectangle(cornerRadius: 8)) // Скругление углов
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 8)
                                           .stroke(Color.gray.opacity(0.3), lineWidth: 1) // Тонкая серая рамка
                                   )
                                   .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
                            Text(state.name)
                                .font(.title2)
                            Spacer()
                            Image(systemName: "chevron.right")
                                  .foregroundColor(.gray) // Вы можете настроить цвет символа
                                  .font(.system(size: 20))
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.3))
                        //                                           .padding(.horizontal)
                    }
                    
                    .onTapGesture {
                        // TODO: Реализуйте переход на другой экран с деталями выбранного штата
                        print("Выбран штат: \(state.name)")
                        withAnimation(.easeInOut(duration: 0.5)) {
                            region = MapCameraPosition.region(MKCoordinateRegion(
                                center: state.centerCoordinate,
                                span: state.span
                            ))
                            hideKeyboard()
                        }
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    Home()
}

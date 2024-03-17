
//  Home.swift
//  USADrive
//
//  Created by AV on 2/18/24.
//
//
import SwiftUI
import MapKit



struct Home: View {

    @Environment(\.colorScheme) var colorScheme

    @State private var region = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
    ))
    
    @State var searchText = ""
    @State var showCancelButton = false
    @State var isShowingBottomSheet = true
    @State private var isHybridMap: Bool = false
    @State private var topButtonImageName: String = "map.fill"
    
    @State private var selectedState: USState?
    @State private var showingStateDetailSheet = false
    
    @State private var darkButtonColor: Color = Color(red: 226 / 255, green: 226 / 255, blue: 226 / 255)
    
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
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
            
            .bottomSheet(presentationDetents: [.medium, .large, .height(220)], isPresented: .constant(isShowingBottomSheet),  isTransparentBG: true) {
                StatesList()
                    .background(content: {
                        Rectangle()
                        //                            .fill(.background)
                            .fill(.thinMaterial)
                            .ignoresSafeArea()
                    })
            } onDismiss: {}
            
            
                .bottomSheet(presentationDetents: [.height(220)], isPresented: .constant(showingStateDetailSheet), dragIndicator: .hidden, isTransparentBG: false) {
                    if let selectedState = selectedState {
                        VStack(alignment: .leading, spacing: 5) {
                            
                            HStack {
                                Text("Selected state: \(selectedState.imageName)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                Spacer()
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        showingStateDetailSheet = false
                                        isShowingBottomSheet = true
                                    }
                                }) {
                                    Image(systemName: "xmark.circle")
                                        .font(.title)
                                        .fontDesign(.rounded)
                                        .foregroundColor(.black)
                                        .shadow(color: .gray, radius:0.5, x: 0.0, y: 0.0)
                                        .padding(.trailing, 20)
                                        .padding(.top, 20)
                                }
                            }

                            
                            
                            Divider()
                                .padding(.horizontal, 20)
                            VStack {
                                Text("Please, select the vehicle type license:")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .fontDesign(.rounded)
                                    .foregroundStyle(.black)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                //                                    .padding(.top, 10)
                            }
                            //                            Divider()
                            
                            HStack() {
                                Button(action: {
                                    // Действие для Car
                                }) {
                                    VStack {
                                        Image(systemName: "car")
                                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                            .font(.title2)
                                        Text("Car")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .fontDesign(.rounded)
                                    }
                                    .padding()
                                    .frame(height: 58)
                                    .frame(width: 106)
                                    .foregroundColor(.black) // Цвет иконки и текста
                                    .background(colorScheme == .dark ? darkButtonColor : .white)                                  .cornerRadius(8) //
                                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 5, y: 5)
                                    .shadow(color: colorScheme == .dark ? darkButtonColor.opacity(0.7) : Color.white.opacity(0.7), radius: 5, x: -5, y: -5)

                                    .padding(.leading, 10)
                                    
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    // Действие для Moto
                                }) {
                                    VStack {
                                        Image("motofront2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .padding(.bottom, -10)
                                        Text("Moto")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .fontDesign(.rounded)
                                        
                                    }
                                    .frame(height: 58)
                                    .frame(width: 106)
                                    .foregroundColor(.black) // Цвет иконки и текста
//                                    .background(darkButtonColor)
                                    .background(colorScheme == .dark ? darkButtonColor : .white) // Фон кнопки

//                                    .background(.white)
                                    
                                    .cornerRadius(8) //
                                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 5, y: 5)
                                    .shadow(color: colorScheme == .dark ? darkButtonColor.opacity(0.7) : Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    // Действие для CDL
                                }) {
                                    VStack {
                                        Image(systemName: "bus")
                                        
                                            .font(.title2)
                                        Text("CDL")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .fontDesign(.rounded)
                                    }
                                    .frame(height: 58)
                                    .frame(width: 106)
                                    .foregroundColor(.black) // Цвет иконки и текста
                                    .background(colorScheme == .dark ? darkButtonColor : .white)                                                                      .cornerRadius(8)
                                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 5, y: 5)
                                    .shadow(color: colorScheme == .dark ? darkButtonColor.opacity(0.7) : Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
//                                    .shadow(color: .gray, radius:0.5, x: 0.0, y: 0.0)
                                    
                                    
                                }
                                
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .padding(.trailing, 30)
                            .padding(.leading, 10)
                            
                            Divider()
                                .padding(.horizontal, 20)
                            
                            //                            VStack(alignment: .center) {
                            //                                Text("Driving law may slightly differ by state")
                            //                                    .font(.headline)
                            //                                    .padding(.leading, 40)
                            //                            }
                            Spacer()
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        
                        .background(AnimatedBackgroundView().edgesIgnoringSafeArea(.all))
                        
                    }
                } onDismiss: {
                    // Логика при скрытии bottomSheet
                }
            
            
            
            
            //MARK: -новый bottom sheet с деталями о штате
            
            
            
            HStack(spacing: 8) { // Для горизонтального расположения "Maps" и "Legal"
                Text("Maps")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.primary.opacity(0.6))
                    .padding(.top, 265) // Размещение на экране
                    .padding(.leading, 10)
                
                Link(destination: URL(string: "https://gspe21-ssl.ls.apple.com/html/attribution-275.html")!) {
                    Text("Legal")
                        .underline() // Добавление подчеркивания к тексту "Legal"
                        .font(.system(size: 9)) // Стилизация текста "Legal"
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary.opacity(0.8))
                }
                .foregroundColor(.primary.opacity(0.6))
                .padding(.top, 265) // Обеспечиваем одинаковое размещение
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Выравнивание блока по левому краю
            .zIndex(1)
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
                        .fill(.thickMaterial)
                    //                        .foregroundStyle(.placeholder)
                }
                
                
                if showCancelButton {
                    Button("cancel", action: {
                        hideKeyboard()
                        searchText = ""
                        showCancelButton = false
                        //                        withAnimation {
                        //                            hideKeyboard()
                        //                            searchText = ""
                        //                            showCancelButton = false
                        //
                        //                        }
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
                            selectedState = state
                            isShowingBottomSheet = false
                            showingStateDetailSheet = true
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

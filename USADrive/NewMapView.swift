//
//  NewMapView.swift
//  USADrive
//
//  Created by AV on 2/28/24.
//

import SwiftUI
import MapKit

struct NewMapView: View {
    
    
    @State private var region = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
        span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
    ))
    
    @State var searchText = ""
    
    
    var filteredStates: [USState] {
        if searchText.isEmpty {
            return states
        } else {
            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.shortForm.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(position: $region)
                .mapStyle(.standard(elevation: .realistic))
            
            DoubleButton(
                topButtonImageName: "map.fill",
                bottomButtonImageName: "location"
            ) { tappedButton in
                switch tappedButton {
                case .top:
                    print("Top button tapped")
                case .bottom:
                    print("Bottom button tapped")
                }
            }
            .padding(.trailing, 10)
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
        .frame(width: 32.0, height: 68.0)
            .background {
                Color.white
                    .cornerRadius(5.0)
                    .shadow(color: .gray, radius:40, x: 0.0, y: 0.0)
            }
        }

    func button(buttonType: ButtonType, imageName: String) -> some View {
        return Button(action: {
            buttonTapped(buttonType)
        }, label: {
            Image(systemName: imageName)
        })
        .padding(8)
        .foregroundColor(.gray)
    }
}

#Preview {
    NewMapView()
}

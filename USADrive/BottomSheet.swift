//
//  BottomSheet.swift
//  USADrive
//
//  Created by AV on 2/22/24.
//

import SwiftUI

struct BottomSheet: View {
    
    @Binding var searchText: String
    
    var filteredStates: [USState] {
        if searchText.isEmpty {
            return states
        } else {
            return states.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.shortForm.lowercased().contains(searchText.lowercased()) }
        }
    }

    
    var body: some View {
        VStack {
//            Text("Choose your State")
//                .fontDesign(.monospaced)
////                            .font(.headline)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.top)
//                .padding(.leading)
            
//            TextField("Search your State", text: $searchText)
////                .textFieldStyle(RoundedBorderTextFieldStyle())
////                .padding()
//                .padding(.vertical, 10)
//                .padding(.horizontal)
//                .background {
//                    RoundedRectangle(cornerRadius: 10, style: .continuous)
//                        .fill(.ultraThickMaterial)
//                }
            
            //States List View
            

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(filteredStates) { state in
                    HStack {
                        Image(state.imageName) 
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
//            .padding(.top, 15)
        }
        }
}


//#Preview {
//    BottomSheet()
//}


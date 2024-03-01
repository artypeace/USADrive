////
////  Extensions.swift
////  USADrive
////
////  Created by AV on 2/17/24.
////
//
import SwiftUI

//MARK: Custom View Extensions
//MARK: Custom Bottom Sheer Extracting from Native SwiftUI
extension View {
    @ViewBuilder
    func bottomSheet<Content: View>(
        presentationDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        dragIndicator: Visibility = .visible,
        sheetCornerRadius: CGFloat?,
        largestUndimmedIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransparentBG: Bool = false,
        interactiveDisabled: Bool = true,
        @ViewBuilder content: @escaping ()->Content,
        onDismiss: @escaping ()->()
    )->some View {
        self.sheet(isPresented: isPresented) {
            onDismiss()
        } content: {
            content()
                .presentationDetents(presentationDetents)
                .presentationDragIndicator(dragIndicator)
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .medium)
                )

                .interactiveDismissDisabled(interactiveDisabled)
                .onAppear {
                    // MARK: Custom Code for bottom sheet
                    // Finding the Presented View Controller
                    guard let windows = UIApplication.shared.connectedScenes.first as?
                            UIWindowScene else {
                        return
                    }
                    
                    // From this Extracting presentation controller
                    //Sometimes buttons and actions will be tinted in hidden form 
                    if let controller = windows.windows.first?.rootViewController?.presentedViewController,let sheet = controller.presentationController as? UISheetPresentationController{
                        //MARK: As Usual Set Properties
                        
                        //FOR TRANSPARENT BACKGROUND
                        if isTransparentBG {
                            controller.view.backgroundColor = .clear
                        }
                         
                        controller.presentingViewController?.view.tintAdjustmentMode = .normal
                        sheet.largestUndimmedDetentIdentifier = largestUndimmedIdentifier
                        sheet.preferredCornerRadius = sheetCornerRadius
                    } else {
                        print("NO Controller found")
                    }
                }
        }
    }
}

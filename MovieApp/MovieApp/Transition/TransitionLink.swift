//
//  TransitionLink.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/27.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

// referred to https://medium.com/swlh/customize-your-navigations-with-swiftui-173a72cd8a04
struct TransitionLink<Content, Destination>: View where Content: View, Destination: View {

    @Binding var isPresented: Bool
    var content: () -> Content
    var destination: () -> Destination

    init(isPresented: Binding<Bool>, @ViewBuilder destination: @escaping () -> Destination, @ViewBuilder content: @escaping () -> Content) {
        self._isPresented = isPresented
        self.content = content
        self.destination = destination
    }

    var body: some View {
        ZStack {
            if self.isPresented {
                self.destination()
                    .transition(.move(edge: .bottom))
            } else {
                self.content()
            }
        }
    }
}

struct ModalLinkViewModifier<Destination>: ViewModifier where Destination: View {
    @Binding var isPresented: Bool
    var destination: () -> Destination

    func body(content: Self.Content) -> some View {
        TransitionLink(isPresented: self.$isPresented) {
            self.destination()
        } content: {
            content
        }
    }
}

extension View {
    func modalLink<Destination: View>(isPresented: Binding<Bool>, destination: @escaping () -> Destination) -> some View {
        self.modifier(ModalLinkViewModifier(isPresented: isPresented, destination: destination))
    }
}

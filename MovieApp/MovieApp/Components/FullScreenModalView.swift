//
//  FullScreenModalView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/27.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a modal view")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView()
    }
}

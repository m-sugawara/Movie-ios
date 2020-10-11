//
//  CircleImage.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/10/11.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url, placeholder: {
            ActivityIndicator(isAnimating: .constant(true), style: .large)
        })
        .aspectRatio(contentMode: .fit)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
        .shadow(radius: 10)
    }
}
//
//struct CircleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImage(image: Image("sample"))
//    }
//}

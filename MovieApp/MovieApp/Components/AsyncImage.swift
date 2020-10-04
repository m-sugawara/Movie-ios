//
//  AsyncImage.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

// refered to https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/
struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder

    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = ObservedObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

//struct AsyncImage_Previews: PreviewProvider {
//    static var previews: some View {
//        AsyncImage(url: URL(string: ""),
//                   placeholder: Text("Loading..."))
//    }
//}

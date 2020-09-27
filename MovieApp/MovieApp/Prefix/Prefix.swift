//
//  Prefix.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/27.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

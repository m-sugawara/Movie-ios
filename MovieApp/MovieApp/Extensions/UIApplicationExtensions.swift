//
//  UIApplicationExtensions.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

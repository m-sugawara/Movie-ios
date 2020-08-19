//
//  VideoViewController.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/08/17.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoViewController: UIViewControllerRepresentable {

    var movieURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        let player = AVPlayer(url: movieURL)
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {

    }
}

struct VideoViewController_Previews: PreviewProvider {
    static var previews: some View {
        VideoViewController(movieURL: URL(string: "")!)
    }
}

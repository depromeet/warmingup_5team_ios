//
//  SplashViewController.swift
//  StreetCat
//
//  Copyright © 2019 depromeet. All rights reserved.
//

import UIKit
import AVFoundation

class SplashViewController: UIViewController {
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false

    override func viewDidLoad() {

        let theURL = Bundle.main.url(forResource: "splash_video_shortened", withExtension: "mp4")

        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none

        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
    }

    @objc func playerItemDidReachEnd(notification: NSNotification) {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController = MapViewController()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.play()
        paused = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
}

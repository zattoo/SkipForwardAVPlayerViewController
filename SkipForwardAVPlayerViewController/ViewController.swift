//
//  ViewController.swift
//  SkipForwardAVPlayerViewController
//
//  Created by Fernando Suarez on 24.04.20.
//  Copyright © 2020 Fernando Suarez. All rights reserved.
//

import UIKit
import AVKit

final class ViewController: AVPlayerViewController, AVPlayerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        isSkipForwardEnabled = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        play(stream: URL(string: "https://demo-hls5-live.zahs.tv/hd/master.m3u8?timeshift=100")!)
    }
    
    // MARK: AVPlayerViewControllerDelegate

    func playerViewController(_ playerViewController: AVPlayerViewController, timeToSeekAfterUserNavigatedFrom oldTime: CMTime, to targetTime: CMTime) -> CMTime {
        guard let player = playerViewController.player else { return oldTime }
        
        guard (playerViewController.isSkipForwardEnabled && targetTime.value > -1) || (playerViewController.isSkipBackwardEnabled && targetTime.value < 1) else {
            return player.currentTime()
        }
        
        return targetTime
    }
    
    // MARK: - Private
    
    private func play(stream: URL) {
        let asset = AVAsset(url: stream)
        let playetItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playetItem)
        player?.play()
    }
}

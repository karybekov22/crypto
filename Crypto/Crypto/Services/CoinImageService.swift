//
//  CoinImageService.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 22/9/21.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.donwload(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self](returnedImage) in
                guard let self = self, let donwloadedImage = returnedImage else { return }
                self.image = donwloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: donwloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}

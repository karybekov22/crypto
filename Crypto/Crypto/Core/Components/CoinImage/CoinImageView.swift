//
//  CoinImageView.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 22/9/21.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageCoinModel
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: CoinImageCoinModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

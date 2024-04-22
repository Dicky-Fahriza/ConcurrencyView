//
//  SymbolVM.swift
//  ConcurrencyView
//
//  Created by MacBook Pro on 22/04/24.
//

import Foundation

class SymbolVM: ObservableObject {
    @Published var symbols: [Symbol] = Symbol.dummyData
    
    // MARK: - ASYNCHRONUS
    func downloadImageWithoutBlockingUI() async {
        let urlString = "https://res.cloudinary.com/dyhiieqlt/image/upload/v1713407570/Screenshot_2024-04-18_at_09.32.36_mki0zd.png?uuid=\(UUID().uuidString)"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
        
            print(data)
            print(url)
        } catch {
            print("Error dowloading image: \(error)")
        }
    }
    
    // MARK" - SYNCHRONUS
    func downloadImageAndBlockUI() {
        let urlString = "https://res.cloudinary.com/dyhiieqlt/image/upload/v1713407570/Screenshot_2024-04-18_at_09.32.36_mki0zd.png?uuid=\(UUID().uuidString)"
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 2)
            let output = try? Data(contentsOf: url)
            
            print(output!)
            print(url)
        }
        
    }
}

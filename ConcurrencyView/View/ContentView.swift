//
//  ContentView.swift
//  ConcurrencyView
//
//  Created by MacBook Pro on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var symbolVM = SymbolVM()
    
    let columns: [GridItem] =  [
        GridItem(.adaptive(minimum: 100), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(symbolVM.symbols) { item in
                        Image(systemName: item.name)
                            .padding()
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.black, Color.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                }
            }
            .navigationTitle("Symbols")
            .toolbar {
                Button {
                    Task { await
                        symbolVM.downloadImageWithoutBlockingUI()
                        
//                        symbolVM.downloadImageAndBlockUI()
                    }
                } label: {
                     Image(systemName: "square.and.arrow.down")
                }
                .tint(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}

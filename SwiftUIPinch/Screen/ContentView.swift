//
//  ContentView.swift
//  SwiftUIPinch
//
//  Created by Kaori Persson on 2022-05-27.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    
    @State private var isAnimating: Bool = false
    
    // MARK: - function
    
    // MARK: - content
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Page image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
            } //: ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimating = true
            })
        } //: NavigationView
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}

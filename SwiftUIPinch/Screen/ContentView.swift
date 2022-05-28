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
    @State private var imageScale: CGFloat = 1
    // CGSize contains both width and height
    //@State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    // CGSize(width: 0, height: 0) can be replace to .zero
    @State private var imageOffset: CGSize = .zero
    
    // MARK: - function
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - content
    
    var body: some View {
        NavigationView {
            ZStack {
                // To occupy the available area, set Color.clear
                Color.clear
                
                // MARK: - Page image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                // offset modifier should come before the scale
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                // MARK: - 1.tap gesture
                // with count 2, it'll be double tap
                // default: single tap(You can omit count attribute)
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            // spring -> bounce animation
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                // MARK: - 2. drag gesture
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                        // when you don't need to use return value, use _, it will be disposed.
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                                
                            }
                    )
            } //: ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimating = true
            })
            // MARK: - info panel
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal, 8)
                    .padding(.top, 30)
                , alignment: .top
            )
            // MARK: - Controls
            .overlay(
                Group{
                    HStack {
                        // Scale down
                        Button {
                            // some action
                        } label: {
                            Image(systemName: "minus.magnifyingglass")
                                .font(.system(size: 36))
                        }
                        
                        // Reset
                        
                        // Scale up
                        
                    }  //: controls
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
            
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

//
//  InfoPanel.swift
//  SwiftUIPinch
//
//  Created by Kaori Persson on 2022-05-28.
//

import SwiftUI

struct InfoPanel: View {
    var scale: CGFloat
    var offset: CGSize
    
    var body: some View {
        HStack {
            // MARK: - hotspot
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .frame(width: 30, height: 30)
            
            // MARK: - info panel
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
                
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            
            Spacer()
        }
    }
}

struct InfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanel(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

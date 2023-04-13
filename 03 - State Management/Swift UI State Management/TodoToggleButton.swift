//
//  TodoToggleButton.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import SwiftUI

struct TodoToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                state.toggle()
            }
        }) {
            GeometryReader { reader in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(.blue)
                    
                    if state {
                        Circle()
                            .frame(width: reader.size.width * 0.8)
                            .foregroundColor(.blue)
                    }
                }
            }
            
        }
        .aspectRatio(contentMode: .fit)
    }
}

struct TodoToggleButton_Previews: PreviewProvider {
        
    static var previews: some View {
        StatefulPreviewWrapper(false) { state in
            TodoToggleButton(state: state)
                .previewLayout(.fixed(width: 100.0, height: 100.0))
        }
    }
}

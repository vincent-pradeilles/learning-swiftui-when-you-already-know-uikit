//
//  SyncingView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import SwiftUI

struct SyncViewProxy {
    fileprivate var maxWidth: CGFloat?
}

struct SyncingView<Content: View>: View {
    
    @State var proxy = SyncViewProxy()
    
    @ViewBuilder var content: (SyncViewProxy) -> Content
    
    var body: some View {
        VStack {
            content(proxy)
        }
        .onPreferenceChange(MaxWidthPreferenceKey.self) { maxWidth in
            proxy.maxWidth = maxWidth
        }
    }
}

struct SyncingWidthModifier: ViewModifier {
    var proxy: SyncViewProxy
    
    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: MaxWidthPreferenceKey.self,
                        value: proxy.size.width
                    )
                }
            }
            .frame(maxWidth: proxy.maxWidth)
    }
}

extension View {
    func syncWidth(using proxy: SyncViewProxy) -> some View {
        self.modifier(SyncingWidthModifier(proxy: proxy))
    }
}

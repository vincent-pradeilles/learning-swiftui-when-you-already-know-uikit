//
//  ContentView.swift
//  SwiftUI Layout System
//
//  Created by Vincent on 23/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("shouldDisplayAnimation")
    var shouldDisplayAnimation: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                images
                VStack(alignment: .leading) {
                    Text("title")
                        .font(.headline)
                    Text("subtitle")
                        .font(.subheadline)
                    rating
                }
                Divider()
                Text("description")
                    .font(.body)
            }
            .padding()
        }
    }
    
    var images: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                HStack {
                    Image("cover")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 350)
                        .id("cover")
                    ForEach(0..<3) { i in
                        Image("image-\(i)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 350)
                            .id("image-\(i)")
                    }
                }
            }.onAppear {
                guard shouldDisplayAnimation else { return }
                defer { shouldDisplayAnimation = false }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        proxy.scrollTo("image-0", anchor: .leading)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        withAnimation {
                            proxy.scrollTo("cover")
                        }
                    }
                }
            }
        }
    }
    
    var rating: some View {
        HStack(spacing: 0) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Image(systemName: "star.leadinghalf.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .onAppear {
                UserDefaults.standard.removeObject(forKey: "shouldDisplayAnimation")
            }
    }
}

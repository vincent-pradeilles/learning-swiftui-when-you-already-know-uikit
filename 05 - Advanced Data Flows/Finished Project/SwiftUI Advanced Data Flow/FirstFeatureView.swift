//
//  FirstFeatureView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 04/09/2021.
//

import SwiftUI

struct FirstFeatureView: View {
            
    @Environment(\.analytics) var analytics: Analytics
        
    var body: some View {
        Text("Feature n°1️⃣")
            .onAppear {
                analytics.send(tag: "Feature_01")
            }
    }
}

struct FirstFeature_Previews: PreviewProvider {
    static var previews: some View {
        FirstFeatureView()
    }
}

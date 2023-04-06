//
//  AdvancedLayoutView.swift
//  SwiftUI Layout System
//
//  Created by Vincent on 15/09/2021.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct AdvancedLayoutView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@v_pradeilles")
                    .alignmentGuide(.midAccountAndName) { d in d[.firstTextBaseline] }
                Image("vincent")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Nom complet:")
                Text("Vincent Pradeilles")
                    .font(.largeTitle)
                    .alignmentGuide(.midAccountAndName) { d in d[.firstTextBaseline] }

            }
        }
    }
}

struct AdvancedLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedLayoutView()
    }
}

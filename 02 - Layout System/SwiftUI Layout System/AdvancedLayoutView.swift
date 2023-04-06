//
//  AdvancedLayoutView.swift
//  SwiftUI Layout System
//
//  Created by Vincent on 15/09/2021.
//

import SwiftUI

extension VerticalAlignment {
    enum AccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let accountAndName = VerticalAlignment(AccountAndName.self)
}

struct AdvancedLayoutView: View {
    var body: some View {
        HStack(alignment: .accountAndName) {
            VStack {
                Text("@v_pradeilles")
                    .alignmentGuide(.accountAndName) { d in d[.firstTextBaseline] }
                Image("vincent")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full Name:")
                Text("Vincent Pradeilles")
                    .font(.largeTitle)
                    .alignmentGuide(.accountAndName) { d in d[.firstTextBaseline] }

            }
        }
    }
}

struct AdvancedLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedLayoutView()
    }
}

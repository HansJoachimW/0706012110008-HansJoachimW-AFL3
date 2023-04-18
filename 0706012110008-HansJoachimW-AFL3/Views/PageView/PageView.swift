//
//  PageView.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    // add state variable to set initial page
    @State private var currentPage = 1
    var pages: [Page]

    var body: some View {
        // embed in zstack
        ZStack(alignment: .bottomTrailing) {
            // declare pageviewcontroller
            // use the $ syntax to create a binding to a value that is stored as state
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

// display
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
    }
}

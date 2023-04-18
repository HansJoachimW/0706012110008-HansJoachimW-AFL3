//
//  CategoryRow.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    // initialize landmarks array
    var items: [Landmark]

    var body: some View {
        // embed data in vstack
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // embed landmarks data in a horizontal scroll view
            ScrollView(.horizontal, showsIndicators: false) {
                // embed landmarks data in hstack
                HStack(alignment: .top, spacing: 0) {
                    // foreach to call each value in the landmarks array
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

// display
struct CategoryRow_Previews: PreviewProvider {
    // get landmarks data
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}

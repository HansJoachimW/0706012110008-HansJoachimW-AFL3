//
//  CategoryItem.swift
//  0706012110008-HansJoachimW-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI

struct CategoryItem: View {
    // initialize landmark variable since we only need to display 1 item for the list
    var landmark: Landmark

    var body: some View {
        // embed in vstack
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

// display
struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}

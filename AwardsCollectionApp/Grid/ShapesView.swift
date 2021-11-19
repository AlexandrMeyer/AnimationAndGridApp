//
//  ShapesView.swift
//  AwardsCollectionApp
//
//  Created by Александр on 19.11.21.
//

import SwiftUI

struct ShapesView: View {
    let activeAwards: [Award]
    
    var body: some View {
        GridView(items: activeAwards, columns: 2) { itemSize, award in
            VStack {
                award.awardView
                Text(award.title)
            }
            .padding()
            .frame(width: itemSize, height: itemSize)
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView(activeAwards: Award.getAwards())
    }
}

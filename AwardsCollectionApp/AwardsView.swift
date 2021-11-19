//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Александр on 14.11.21.
//

import SwiftUI

struct AwardsView: View {
    
    let awards = Award.getAwards()
    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activeAwards, id: \.title) { award in
                        VStack {
                            award.awardView
                            Text("\(award.title)")
                        }
                    }
                }
            }
            .navigationTitle("Your Awards \(activeAwards.count)")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}

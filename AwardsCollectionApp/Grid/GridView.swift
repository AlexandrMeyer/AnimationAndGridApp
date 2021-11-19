//
//  GridView.swift
//  AwardsCollectionApp
//
//  Created by Александр on 19.11.21.
//

import SwiftUI

struct GridView<Content, T>: View where Content: View {
    let items: [T]
    let columns: Int
    let content: (CGFloat, T) -> Content
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideLength = geometry.size.width / CGFloat(columns)
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(sideLength, items[index])
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [17, 2, 4, 23, 6, 45, 8], columns: 3) { item in
            Text("\(item)")
        }
    }
}

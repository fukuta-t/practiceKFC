//
//  MenuView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/09/22.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct MenuItems: Codable {
    var id: String
    var image: String
    var name: String
}

struct MenuCategories: Codable {
    var id: String
    var image: String
    var name: String
    var childs:[MenuItems]
}

struct MenuView: View {
    let items:[MenuCategories] = Bundle.main.decodeJSON("menu.json")
        
    @State var expanded:[Int:Bool] = [:]
    
    func isExpanded(_ id:Int) -> Bool {
        expanded[id] ?? false
    }
    
    // 選択時はコレクションView表示する。　商品名選択でPush遷移
    var body: some View {
        List {
            ForEach((0..<items.count), id: \.self) { row in
                Section(header:
                    HStack {
                        Image(self.items[row].childs[0].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .leading)
                        Text("\(self.items[row].name)").onTapGesture {
                            self.expanded[row] = !self.isExpanded(row)
                        }
                        .frame(height: 44)
                    }
                ) {
                    if self.isExpanded(row) {
                        ForEach((0..<self.items[row].childs.count), id: \.self) { row2 in
                            HStack {
                                Image(self.items[row].childs[row2].image)
                                    .resizable()
                                .scaledToFit()
                                    .frame(width: 40, height: 40, alignment: .leading)
                                Text("\(self.items[row].childs[row2].name)")
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct subsubview: View {
    let name: String
    let color: Color
    var body: some View{
        Text("Hello World")
    }
}

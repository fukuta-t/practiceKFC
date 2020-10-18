//
//  MenuView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/09/22.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct MenuItems: Identifiable {
    var id: String
    var image: String
    var name: String
}

struct MenuCategories: Identifiable {
    var id: String
    var image: String
    var name: String
    var childs:[MenuItems]
}

struct MenuView: View {
    var items = [
        MenuCategories(id:"0", image:"bell", name:"骨なしA",
                 childs:[
                    MenuItems(id:"0", image:"bell", name:"骨なし1"),
                    MenuItems(id:"0", image:"bell", name:"骨なし2"),
                    MenuItems(id:"0", image:"bell", name:"骨なし3")]),
        MenuCategories(id:"1", image:"bell", name:"クリスピー",
                 childs:[
                    MenuItems(id:"0", image:"bell", name:"骨なしa"),
                    MenuItems(id:"0", image:"bell", name:"骨なしb"),
                    MenuItems(id:"0", image:"bell", name:"骨なしc")]),
        MenuCategories(id:"2", image:"bell", name:"オリジナルチキン",
                 childs:[
                    MenuItems(id:"0", image:"bell", name:"骨あり1"),
                    MenuItems(id:"0", image:"bell", name:"骨あり2"),
                    MenuItems(id:"0", image:"bell", name:"骨あり3")
        ])
    ]
    
    @State var expanded:[Int:Bool] = [:]
    
    func isExpanded(_ id:Int) -> Bool {
        expanded[id] ?? false
    }
    
    var body: some View {
        List {
            ForEach((0..<items.count), id: \.self) { row in
                Section(header:
                    Text("\(self.items[row].name)").onTapGesture {
                        self.expanded[row] = !self.isExpanded(row)
                }
                    .frame(height: 44)
                ) {
                    if self.isExpanded(row) {
                        ForEach((0..<self.items[row].childs.count), id: \.self) { row2 in
                            Text("\(self.items[row].childs[row2].name)")
                        }
                    }
                }
            }
        }
    }
}

struct subsubview: View {
    let name: String
    let color: Color
    var body: some View{
        Text("Hello World")
    }
}

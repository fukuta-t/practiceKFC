//
//  MenuView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/09/22.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id: String
    var image: String
    var name: String
}


struct MenuView: View {
    let items = [MenuItem(id:"0", image:"bell", name:"骨なし"),
                 MenuItem(id:"1", image:"bell", name:"クリスピー"),
                 MenuItem(id:"2", image:"bell", name:"オリジナルチキン")]
    
    var body: some View {
        List (items) { item in
            // 後でRowクラス作成してDelegate切る
            Button(action: {
                print("\(item.id)番目押した")
            }, label:{
                HStack {
                    Image("\(item.image)")
                        .frame(width: 44, height: 44, alignment: .center)
                    Text("\(item.name)")
                    Spacer()
                    Text("●")
                }
            }).background(Color.green)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

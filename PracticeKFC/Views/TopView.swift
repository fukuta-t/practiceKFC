//
//  TopView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/09/22.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                Text("おすすめ商品エリア")
                    .frame(width: 340, height: 80, alignment: .center)
                    .background(Color.yellow)
                    .padding(.all)
                // マイル表示エリア
                ChickenMileView()
                
                Text("広告エリア")
                    .frame(width: 340, height: 80, alignment: .center)
                    .background(Color.green)
                    .padding(.horizontal)
                Text("広告エリア")
                    .frame(width: 340, height: 80, alignment: .center)
                    .background(Color.green)
                    .padding()
            }
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}

// チキンマイル表示エリア
struct ChickenMileView: View {
    var body: some View {
        HStack {
            Image("bell")
                .frame(width: 44, height: 44, alignment: .center)
            Text("あなたのチキンマイルは900です")
                .background(Color.red)
            Text("確認")
                .frame(width: 44, height: 44, alignment: .center)
                .background(Color.gray)
        }
    }
}

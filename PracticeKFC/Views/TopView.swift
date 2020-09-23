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
                    .background(Color(red: 0.827, green: 0.929, blue: 0.984, opacity: 1.0))
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
    // View本体の描画サイズはオブジェクト全体のサイズに引きずられる。
    // 例としてオブジェクトの高さが36しかなかったらView本体も36になる
    // プロパティの設定順を間違えるとレイアウトがめちゃめちゃ変わる
    var body: some View {
        HStack {
            Text("")
                .frame(width: 0, height: 60, alignment: .center)
                .background(Color(red: 0.827, green: 0.929, blue: 0.984, opacity: 1.0))
            Text(" 現在のチキンマイル")
                .font(.system(size: 10, weight: .black, design: .default))
                .frame(width: 180, height: 40, alignment: .center)
                .background(Color.white)
                .offset(x: 30, y: 0)
            Text("900")
                .frame(width: 130, height: 40, alignment: .center)
                .background(Color.white)
                .offset(x: 20, y: 0)
            Image("bell")
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color.orange)
                .cornerRadius(20.0)
                .offset(x: -310, y: 0)
            Text("マイページ\n確認")
                .foregroundColor(Color.white)
                .font(.system(size: 10, weight: .black, design: .default))
                .frame(width: 60, height: 36, alignment: .center)
                .background(Color.red)
                .cornerRadius(20.0)
                .offset(x: -50, y: 0)
        }
    }
}

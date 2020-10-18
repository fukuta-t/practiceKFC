//
//  CouponView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/09/22.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct CouponView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            HStack{
                /*
                 選択色はベース赤　文字白
                 非選択色はベース白　文字灰
                 */
                Picker("", selection: self.$selectedIndex) {
                        Text("通常")
                            .tag(0)
                        Text("スペシャル")
                            .tag(1)
                        Text("お気に入り")
                            .tag(2)
                    }
                    // コンテンツの高さ変更機能がない。ラッピングして対応？
                    .frame(width: 300, height: 30, alignment: .leading)
                    .pickerStyle(SegmentedPickerStyle())
                    
                Button (action: {
                    /*
                        1. ボタンのアイコンが入れ替わる。
                        2. コレクションビューの表示がリストからボックスになる
                     */
                }) {
                    Image("viewIcon")
                }
            }
            ScrollView{
                CouponTicketView()
            }
            // Constaintを設定してフッターに接地させる
            QRCodeView()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -9, trailing: 0))
        }
    }
    
    init() {
        let font = UIFont(name: "AvenirNext-Medium", size: 16)!
        let selectedColor   = UIColor.white
        let unSelectedColor = UIColor.gray
        // ※UISegmentedControl.appearance()を使用すると、アプリ内のセグメント全てに適用されるので注意
        // 選択中のセグメントの色
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        // 背景色(角丸長方形になってるコンテンツエリア全部の背景)
        UISegmentedControl.appearance().backgroundColor = .white
        
        // 通常時のフォントと前景色
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: unSelectedColor.cgColor,
        ], for: .normal)
        
        // 選択時のフォントと前景色
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: selectedColor.cgColor,
        ], for: .selected)
    }

}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponView()
    }
}

// 親ViewとのBottoms:0にしたい
struct QRCodeView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("会員証")
                    .fontWeight(.heavy)
                Text("お会計時にレジににてQRコードを\n店員に見せてください")
                    .lineLimit(1)
                Text("※タップすると拡大されます")
                    .foregroundColor(.red)
            }
           Text("QR")
            .frame(width: 80, height: 80, alignment: .center)
//            .background(Color.yellow)
        }
            // 色がなんか変だけどとりあえず放置
            // #fffacd
            .background(Color(red: 0.700, green: 0.680, blue: 0.654, opacity: 1.0))
            .frame(width: 414, height: 100)
    }
}


//
//  InformationView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/10/25.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct InformationItem: Codable {
    var id: String
    var infoDate :String
    var isOpenDocument: String
    var infoTitle: String
}

// お知らせで表示するModal
/*
 List選択でSafari起動とpush遷移のパターンあり
 右上に❎ボタン
 */


struct InformationView: View {
    // お知らせModalDissmiss用
    @Environment(\.presentationMode) private var presentationMode

    let coloredNavAppearance = UINavigationBarAppearance()
    let Informations: [InformationItem] = Bundle.main.decodeJSON("information.json")

    // NavigationBarの背景色強制変更
    // これ共通化したい
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    //　※SwiftUI1.0では機能が実装されていないため、fullscreen実装不可。ラッピングならできるかも…
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: Text("bb")) { Text("")
                }
                .navigationBarTitle("お知らせ", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        // dismiss
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("❌")
                    }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
            Text("")
                .frame(maxWidth: .infinity, maxHeight: 4)
                .background(Color.red)
            List {
                ForEach (0..<Informations.count) { row in
                    HStack {
                        // メールアイコン
                        Image("bell.png")
                            .frame(maxWidth: 55, maxHeight: 70)
                        VStack {
                            Text("\(self.Informations[row].infoDate)")
                                .frame(maxWidth: 300, maxHeight: 20, alignment: .topLeading)
                            Text("\(self.Informations[row].infoTitle)")
                                .frame(maxWidth: 300, maxHeight: 50, alignment: .topLeading)
                        }
                    }.frame(maxHeight: 100)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

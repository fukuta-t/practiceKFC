//
//  ContentView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/09/22.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

// jsonファイル読み込みの機能拡張
extension Bundle {
    func decodeJSON<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Faild to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}

// NavigationBarのカスタムModifier
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.system(size: 12, weight: .black, design: .default))
        }
    }
}

// カスタムModifierのメソッド名を watermarked() に置き換え
extension View {
    func watermarked(text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State var isShowModal = false
    // お知らせModalDissmiss用
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        // 画面サイズの取得
        GeometryReader { geometry in
            VStack{
                // navigation
                NavigationView {
                    NavigationLink(destination: Text("aa")) { Text("")
                    }
                    .navigationBarTitle("KFC", displayMode: .inline)
                    .background(Color.white)
                    .navigationBarItems(trailing:
                        HStack {
                            Button(action: {
                                self.isShowModal.toggle()
                            }){
                                Image(systemName:"bell")
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44, alignment: .center)
                                    .watermarked(text: "お知らせ")
                            }.sheet(isPresented: self.$isShowModal) {
                                InformationView()
                            }
                            
                            Button(action: {
                                self.isShowModal.toggle()
                            }){
                                // ToDo:画像読み込めない問題。　assetにはある
                                // No image named 'search' found in asset catalog for main bundle
                                Image(systemName:"search")
                                    .frame(width: 44, height: 44, alignment: .center)
                                    .scaledToFit()
                                    .watermarked(text: "店舗検索")
                            }.sheet(isPresented: self.$isShowModal) {
                                InformationView()
                            }
                        })
                }
                .frame(width: geometry.size.width, height: 44, alignment: .center)
                
                TabBarControllerView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarControllerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let controller = UITabBarController()
        
        let vc1 = UIHostingController(rootView: TopView())
        vc1.tabBarItem = UITabBarItem(title: "Top", image: UIImage(named: "tab-icon-sample"), tag: 1)
        
        let vc2 = UIHostingController(rootView: MenuView())
        vc2.tabBarItem = UITabBarItem(title: "メニュー", image: UIImage(named: "tab-icon-sample"), tag: 2)
        
        let vc3 = UIHostingController(rootView: CouponView())
        vc3.tabBarItem = UITabBarItem(title: "クーポン", image: UIImage(named: "tab-icon-sample"), tag: 3)
        
        let vc4 = UIHostingController(rootView: MyPageView())
        vc4.tabBarItem = UITabBarItem(title: "マイページ", image: UIImage(named: "tab-icon-sample"), tag: 4)
        
        let vc5 = UIHostingController(rootView: MemberIdView())
        vc5.tabBarItem = UITabBarItem(title: "会員証", image: UIImage(named: "tab-icon-sample"), tag: 5)
        
        let vcs = [vc1, vc2, vc3, vc4, vc5]
        controller.setViewControllers(vcs, animated: true)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
    }
}


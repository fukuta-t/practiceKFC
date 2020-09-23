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
              Picker("", selection: self.$selectedIndex) {
                      Text("通常")
                          .tag(0)
                      Text("スペシャル")
                          .tag(1)
                      Text("お気に入り")
                          .tag(2)
                  }
                  .pickerStyle(SegmentedPickerStyle())
            ScrollView{
                Text("aaaa")
            }
        }
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponView()
    }
}

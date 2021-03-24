//
//  CouponTicketView.swift
//  PracticeKFC
//
//  Created by fukutappe on 2020/10/01.
//  Copyright © 2020 福田卓哉. All rights reserved.
//

import SwiftUI

struct CouponTicketView: View {
    var couponItem:couponContents
    var body: some View {
        VStack {
            Image(couponItem.image)
                .resizable()
                .scaledToFill()
                .frame(width: 340, height: 230)

//                .background(Color.red)
//                .frame(width: 380, height: 130, alignment: .center)
            HStack{
//                Image("bell")
                Button(action: {
                    print("お気に入り押した")
                }) {
                    Text("お気に入り")
                }
                .frame(width: 300, height: 40)
                Text(" ")
                    .background(Color.gray)
                    .frame(width: 1, height: 40)
                Button(action: {
                    print("インフォメーション押した")
                }) {
                    Text("◇")
//                    Image("nCoupon1")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 380, height: 130)
                }
                .frame(width: 40, height: 40)
            }
        }
    }
}

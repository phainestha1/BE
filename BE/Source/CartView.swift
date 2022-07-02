//
//  CartView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    @State var quantity: Int = 0
    @State var isAlertActive: Bool = false
    
    func showAlert() {
        self.isAlertActive = true
    }
    
    var body: some View {
        VStack {
            // 상단 툴바
            UpperToolbar()
                .padding(.horizontal, 24)
                .padding(.bottom, 7)
            
            ZStack {
                BackgroundRectangle()
                
                VStack {
                    MenuTitle()
                    
                    HStack {
                        Text(Restaurant.restaurantName)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    // Menu Review List
                    ScrollView {
                        ForEach(orderViewModel.orders) { item in
                            MenuReviewContainer(
                                menuName: item.menu,
                                price: 1000,
                                quantity: 1
                            )
                            
                        }
                    }
                    
                    HStack {
                        Text("총 주문금액")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("12,000" + "원")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    LongBottomButton(
                        title: "주문하기",
                        backgroundColor: Color.main,
                        action: showAlert
                    )
                    .alert(isPresented: $isAlertActive) {
                        Alert(
                            title: Text("주문하기"),
                            message: Text("주문을 완료하시겠습니까? 완료 후, 해당 계좌로 입금하시면 도시락을 배달 받으실 수 있습니다."),
                            primaryButton: .default(
                                Text("취소"),
                                action: { }
                            ),
                            secondaryButton: .default(
                                Text("확인"),
                                action: { }
                            )
                        )
                    }
                    
                }// VStack
                .padding(.horizontal, 22)
            }// ZStack
        }// VStack
        .background(Color.main.ignoresSafeArea())
    }// body
}// CartView

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
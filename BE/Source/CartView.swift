//
//  CartView.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import SwiftUI

struct CartView: View {
    @State var quantity: Int = 0
    @State var isAlertActive: Bool = false
    @State var totalPrice: Int = 0
    @State var isOrderCompleted: Bool = false
    
    let orderManger: OrderManager
    
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
                        Text("참서리")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    
                    // Menu Review List
                    ScrollView {
                        ForEach(orderManger.fetchCountPerMenues(), id: \.self) { item in
                            if item.quantity != 0 {
                                MenuReviewContainer(
                                    menu: item.name,
                                    price: item.price,
                                    quantity: item.quantity
                                )
                                .onAppear {
                                    print("Hello")
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Text("총 주문금액")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("\(self.totalPrice)" + "원")
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
                                action: processOrder
                            )
                        )
                    }
                    
                    NavigationLink(
                        destination: OrderCompletionView(),
                        isActive: $isOrderCompleted
                    ) {
                        EmptyView()
                    }
                    
                }// VStack
                .padding(.horizontal, 22)
            }// ZStack
        }// VStack
        .background(Color.main.ignoresSafeArea())
    }// body
    
    func showAlert() {
        self.isAlertActive = true
    }
    
    func processOrder() {
        OrderManager.shared.order()
        self.isOrderCompleted = true
    }
    
}// CartView

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}

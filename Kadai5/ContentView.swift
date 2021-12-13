//
//  ContentView.swift
//  Kadai5
//
//  Created by mana on 2021/12/13.
//

import SwiftUI

struct ContentView: View {
    @State private var leftNumber: Float?
    @State private var rightNumber: Float?
    @State private var isShowAlert = false
    @State private var answer: Float = 0
    @State private var message: String = ""

    var body: some View {
        VStack(spacing: 40.0) {
            HStack(spacing: 10.0) {
                NumberField(number: $leftNumber)
                Text("÷")
                NumberField(number: $rightNumber)
            }

            Button(action: {
                calculation(leftNumber: leftNumber, rightNumber: rightNumber)
            }, label: {Text("計算")})

            Text(String(answer))
        }
        .alert("課題5", isPresented: $isShowAlert, actions: {}, message: {
            Text(message)
        })
    }
// できればこの関数は、構造体の外に出したい
    private func calculation(leftNumber: Float?, rightNumber: Float?) {
        guard let leftNumber = leftNumber else {
            message = Message.blankLeftNumber.rawValue // 直接文言を代入して良いのではないか。
            isShowAlert = true
            return
        }

        guard let rightNumber = rightNumber else {
            message = Message.blankRightNumber.rawValue
            isShowAlert = true
            return
        }

        guard rightNumber != 0 else {
            message = Message.zeroRightNumber.rawValue
            isShowAlert = true
            return
        }

        answer = leftNumber / rightNumber
    }
}

struct NumberField: View {
    @Binding var number: Float?

    var body: some View {
        TextField("", value: $number, format: .number)
            .frame(width: 150.0, height: 50.0)
            .border(.secondary, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .keyboardType(.numberPad)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

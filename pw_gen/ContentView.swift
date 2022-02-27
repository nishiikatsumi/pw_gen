//
//  ContentView.swift
//  pw_gen
//
//  Created by 西井勝巳 on 2022/02/28.
//

import SwiftUI

struct ContentView: View {
    
    let orders = ["0桁", "1桁", "2桁", "3桁", "4桁", "5桁", "6桁", "7桁", "8桁", "9桁", "10桁", "11桁", "12桁", "13桁", "14桁", "15桁", "16桁", "17桁", "18桁", "19桁", "20桁"]
    @State private var keyNum = 12
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("パスワード生成ソフト")
                .font(.title)
            
            HStack {
                Text("桁数の選択")
                Picker(selection: $keyNum, label: Text("")) {
                    ForEach(8..<21) { num in
                        Text(orders[num]).tag(num)
                    }
                }
            }
            
            VStack {
                Text("パスワード:")
                    .font(.title)
                Text("\(password)")
                    .font(.title)
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button {
                    UIPasteboard.general.string = password
                } label: {
                    Text("クリップボードにコピー")
                }
            Button {
                password = makePWString()
            } label: {
                Text("生成")
            }
            .padding()
            }
        }
    }
    
    func makePWString() -> String {
        
        let keyString = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var pw: String = ""
        
        for _ in 0..<keyNum {
            let randNum = Int.random(in: 0..<62)
            let startIndex = keyString.index(keyString.startIndex, offsetBy: randNum)
            let endIndex = keyString.index(keyString.startIndex, offsetBy: randNum)
            pw += keyString[startIndex...endIndex]
        }
        
        return pw
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

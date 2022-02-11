//
//  SettingView.swift
//  Study_MyTimer
//
//  Created by Yota on 2022/02/09.
//

import SwiftUI

struct SettingView: View {
    @State var timerValue = 10
    
    var body: some View {
        ZStack{
            // 背景色
            Color("backgroundSetting")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                // 選択値表示
                Text("\(timerValue)秒")
                    .font(.largeTitle)
                
                Spacer()
                
                // Picker
                Picker(selection: $timerValue, label: Text("選択")){
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                }
                .pickerStyle(.wheel)
                
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

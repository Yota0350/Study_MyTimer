//
//  ContentView.swift
//  Study_MyTimer
//
//  Created by Yota on 2022/02/09.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count = 0
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0){
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    HStack{
                        // スタートボタン
                        Button(action: {
                            startTimer()
                        }){
                          Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        // ストップボタン
                        Button(action: {
                            if let unwrapedTimerHandler = timerHandler{
                                if unwrapedTimerHandler.isValid {
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        }){
                          Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear{
                count = 0
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: SettingView()){
                        Text("秒数設定")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // カウントダウン処理
    func countDownTimer(){
        count += 1
        
        if(timerValue - count <= 0){
            timerHandler?.invalidate()
        }
    }
    
    // カウントダウンを開始する
    func startTimer(){
        // タイマーが実行中であれば実行しない
        if let unwrapedTimerHandler = timerHandler{
            if(unwrapedTimerHandler.isValid){
                return
            }
        }
        
        // 残り時間を初期化する
        if(timerValue - count <= 0){
            count = 0
        }
        
        // タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

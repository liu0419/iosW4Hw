//
//  ContentView.swift
//  w4Hw
//
//  Created by 劉丞晏 on 2025/3/15.
//

import SwiftUI

// 資料模型
struct Profile: Identifiable {
    let id = UUID()
    let name: String
    let status: String
    let message: String
    let story: String
    let avatarImageName: String
    let bubbleImageName: String
}

struct ContentView: View {
    let items = ["All", "飯友", "球友", "讀書好夥伴"]
    
    
    // 假資料
    let sampleProfiles: [Profile] = [
        Profile(name: "林小美", status: "最近在忙：申請實習\n有空程度：🌕🌕🌗🌑🌑", message: "我最近準備面試搞到焦頭爛額拉！不要誘惑我出去玩！", story: "在11/5 中午，11/6晚上可以找我吃飯聊聊！", avatarImageName: "3d_avatar_12", bubbleImageName: "Group 37065"),
        Profile(name: "阿宏", status: "最近在忙：專題期末報告\n有空程度：🌕🌕🌕🌗🌑", message: "我快被報告追殺了，只能吃飯聊30分鐘！", story: "12/1 晚上或週末有空吃飯。", avatarImageName: "3d_avatar_26", bubbleImageName: "Group 37065"),
        Profile(name: "劉曉晨", status: "最近在忙：籌備社團活動\n有空程度：🌕🌕🌕🌕🌑", message: "我快被報告追殺了，只能吃飯聊30分鐘！", story: "在11/4早上、11/5下午都可以找我去咖啡廳！", avatarImageName: "3d_avatar_20", bubbleImageName: "Group 37065"),
        Profile(name: "高辰辰", status: "最近在忙：練球\n有空程度：🌕🌕🌕🌗🌑", message: "我快被報告追殺了，只能吃飯聊30分鐘！", story: "12/1 晚上或週末有空吃飯。", avatarImageName: "30", bubbleImageName: "Group 37065"),

        
    ]
    
    var body: some View {
        ZStack {
            // 背景圖片
            GeometryReader { geometry in
                Image("bg")
                    .resizable()
                    .scaledToFit() // 按比例縮放
                    .frame(width: geometry.size.width) // 設定寬度等於螢幕寬度
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // 置中
                    .offset(y: -(geometry.size.height - (geometry.size.width * (9 / 16))) / 2) // 對齊螢幕頂部
            }
            .ignoresSafeArea()
            
          
          
                VStack(spacing: 20) {
                    // 我的摯友：導覽列
                    HStack {
                        Image(systemName: "arrowshape.backward")
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25) // 圖示與文字差不多大
                        Text("我的摯友")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25) // 圖示與文字差不多大
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .frame(width: 380)
                    
                  
                    
                    // 分類選單
                  

                        HStack(alignment: .center,spacing: 12) {
                            ForEach(items, id: \.self) { text in
                                TextContainer(text: text)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .center)
                         
                    
                    
                 
                    // Profile Card List
                    ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        ForEach(sampleProfiles) { profile in
                            ProfileCardView(profile: profile)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 50)
                }
            }
        }
    }
    
    // 定義一個單獨的 Container 視圖
    struct TextContainer: View {
        let text: String
        
        var body: some View {
            Text(text)
                .font(.system(size: 16)) // 文字大小
                .padding(.horizontal, 12) // 水平內邊距，讓寬度隨字數變化
                .frame(height: 33) // 設定高度為 33px
                .overlay(
                    RoundedRectangle(cornerRadius: 8.3)
                        .stroke(Color.white, lineWidth: 2) // 設定邊框顏色和線條寬度
                )
        }
    }
    
    struct ProfileCardView: View {
        let profile: Profile
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 31)
                    .fill(Color(red: 251/255, green: 250/255, blue: 243/255))
                    .frame(width: 370, height: 217)
                    .shadow(radius: 2)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .top, spacing: 25) {
                        VStack(spacing: 4) {
                            Image(profile.avatarImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                            
                            Text(profile.name)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        .frame(width: 100)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(profile.status)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.black)
                                .lineSpacing(4)
                            
                            
                            
                            ZStack(alignment: .center) {
                                
                                Text(profile.message)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(
                                        Image(profile.bubbleImageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .offset(y:-5)
                                    )
                                    .frame(width: 220, alignment: .leading)
                                    .lineLimit(3)
                            }
                            .padding(.top, 4)
                            .frame(height: 80)
                            .offset(x:-20)
                        }
                    }
                    
                    
                    Text(profile.story)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 23)
                .padding(.vertical, 18)
                .frame(width: 390, height: 217)
            }
        }
    }
}

        
    
        
        

#Preview {
    ContentView()
}

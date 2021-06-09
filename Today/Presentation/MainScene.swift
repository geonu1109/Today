//
//  MainScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

struct MainScene: View {
    var body: some View {
        TabView {
            ListScene()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("목록")
                }
            TodayScene()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("오늘")
                }
        }
    }
}

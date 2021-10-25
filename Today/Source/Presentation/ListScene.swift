//
//  ListScene.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI
import Combine

struct ListScene: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle("목록")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: CreationScene { (newTask) in },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
    }
}

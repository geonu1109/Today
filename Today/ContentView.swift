//
//  ContentView.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
    let movieClient: MovieClient = KOBISMovieClient()
    
    @State
    var text: String = "hello world"
    
    var body: some View {
        VStack {
            Text(self.text)
                .lineSpacing(1.15)
            Button("요청") {
                Task {
                    do {
                        let data = try await self.movieClient.get()
                        self.text = String(data: data, encoding: .utf8) ?? data.description
                    } catch {
                        self.text = "error: \(error)"
                    }
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

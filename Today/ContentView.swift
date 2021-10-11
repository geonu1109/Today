//
//  ContentView.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
    let movieRepository: MovieRepository = .init(client: KOBISMovieClient(), dao: UserDefaultsMovieDAO())
    
    @State
    var movies: [Movie] = []
    
    @State
    var error: Error?
    
    var body: some View {
        NavigationView {
            if let error = error {
                Text(String(describing: error))
            } else {
                List(self.movies) { (movie) in
                    MovieRowView(movie: movie)
                }.listStyle(PlainListStyle())
                .navigationTitle("박스오피스 순위")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            Task {
                do {
                    self.movies = try await self.movieRepository.findAll(by: .init(from: .now - 3600 * 24))
                } catch {
                    self.error = error
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

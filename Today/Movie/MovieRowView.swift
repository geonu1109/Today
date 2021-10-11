//
//  MovieRowView.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/12.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(self.movie.rank)위")
                .foregroundColor(.secondary)
                .font(.caption)
            Text(self.movie.name)
                .lineLimit(1)
                .font(.headline)
            HStack(spacing: 0) {
                Text("\(self.movie.releaseDate.description) 개봉")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("관객: \(self.movie.audienceNumber)(")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text((self.movie.audienceNumberChange >= 0 ? "+" : "") + "\(self.movie.audienceNumberChange)")
                    .foregroundColor(self.movie.audienceNumberChange >= 0 ? .green : .red)
                    .font(.caption)
                Text(")명")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: .example)
    }
}

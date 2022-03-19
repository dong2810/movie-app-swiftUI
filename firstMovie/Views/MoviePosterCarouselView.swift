//
//  MoviePosterCarouselView.swift
//  firstMovie
//
//  Created by đông on 09/12/2021.
//

import SwiftUI

struct MoviePosterCarouselView: View {

	@State private var rotateIn3D = false
	let title: String
	let movies: [Movie]

	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text(title)
				.font(.title)
				.fontWeight(.bold)
				.padding(.horizontal)

			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 16) {
					ForEach(self.movies) { movie in
						NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
//							GeometryReader { geometry in
								MoviePosterCard(movie: movie)
//								.rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 50) / -30), axis: (x: 0, y: 100.0, z: 0))
//									.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true),
//											 value: rotateIn3D)
//							}
//							.frame(width: 250, height: 400)
						}
							.buttonStyle(PlainButtonStyle())
							.padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
							.padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
					}
				}
			}
		}

	}
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
	static var previews: some View {
		MoviePosterCarouselView(title: "Now Playing", movies: Movie.stubbedMovies)
	}
}

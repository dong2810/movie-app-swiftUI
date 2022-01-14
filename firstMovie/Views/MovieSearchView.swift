//
//  MovieSearchView.swift
//  firstMovie
//
//  Created by đông on 30/12/2021.
//

import SwiftUI

struct MovieSearchView: View {

	@ObservedObject var movieSearchState = MovieSearchState()

    var body: some View {
		NavigationView {
			List {
				SearchBarView(placeholder: "Type name of Movies", text: self.$movieSearchState.query)

				LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
					self.movieSearchState.search(query: self.movieSearchState.query)
				}
				if self.movieSearchState.movies != nil {
					ForEach (self.movieSearchState.movies!) {
						movie in
						NavigationLink (destination: MovieDetailView(movieId: movie.id)) {
							VStack(alignment: .leading) {
								Text(movie.title)
								Text(movie.yearText)
							}
						}
					}
				}
			}
			.onAppear {
				self.movieSearchState.startObserve()
			}.navigationTitle("Search Movies")
		}
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}

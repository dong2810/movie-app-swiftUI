//
//  MovieListView.swift
//  firstMovie
//
//  Created by đông on 13/01/2022.
//

import SwiftUI
import FSPagerView

struct MovieListView: View {
	@ObservedObject private var nowPlayingState = MovieListState()
	@ObservedObject private var upcomingState = MovieListState()
	@ObservedObject private var topRatedState = MovieListState()
	@ObservedObject private var popularState = MovieListState()

	var body: some View {
		NavigationView {
			List {
//				Group {
//					HStack {
//						Button {
//							print("Button pressed")
//						} label: {
//							Text("Press Me")
//								.padding(20)
//						}
//						.background(Color.gray)
//						.cornerRadius(20)
//						.buttonStyle(PlainButtonStyle())
//					}
//				}

				Group {
					if nowPlayingState.movies != nil {
						MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)	

					} else {
						LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
							self.nowPlayingState.loadMovies(with: .nowPlaying)
						}
					}

				}
				.listRowSeparator(.hidden)
				.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))

				Group {
					if upcomingState.movies != nil {
						MovieBackdropCarouselView(title: "Upcoming", movies: upcomingState.movies!)
					} else {
						LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
							self.upcomingState.loadMovies(with: .upcoming)
						}
					}
				}
				.listRowSeparator(.hidden)
				.listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))


				Group {
					if topRatedState.movies != nil {
						MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)

					} else {
						LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
							self.topRatedState.loadMovies(with: .topRated)
						}
					}
				}
				.listRowSeparator(.hidden)
				.listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

				Group {
					if popularState.movies != nil {
						MovieBackdropCarouselView(title: "Popular", movies: popularState.movies!)

					} else {
						LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
							self.popularState.loadMovies(with: .popular)
						}
					}
				}
				.listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
			}
			.listStyle(PlainListStyle())
			.navigationBarTitle("Home")
			.navigationBarItems(leading: HStack {
				Button {
				} label: {
					Image(systemName: "list.bullet")
				}.frame(minWidth: 0, maxWidth: .infinity)
			})
		.onAppear {
			self.nowPlayingState.loadMovies(with: .nowPlaying)
			self.upcomingState.loadMovies(with: .upcoming)
			self.topRatedState.loadMovies(with: .topRated)
			self.popularState.loadMovies(with: .popular)
		}

	}
}

struct MovieListView_Previews: PreviewProvider {
	static var previews: some View {
		MovieListView()
	}
}
}


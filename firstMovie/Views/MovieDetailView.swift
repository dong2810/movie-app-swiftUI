//
//  MovieDetailView.swift
//  firstMovie
//
//  Created by đông on 15/12/2021.
//

import SwiftUI

struct MovieDetailView: View {
	let movieId: Int
	@ObservedObject private var movieDetailState = MovieDetailState()

	var body: some View {
		ZStack {
			LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
				self.movieDetailState.loadMovie(id: self.movieId)
			}

			if movieDetailState.movie != nil {
				MovieDetailListView(movie: self.movieDetailState.movie!)
			}
		}
		.onAppear {
			self.movieDetailState.loadMovie(id: self.movieId)
		}
	}
}

struct MovieDetailListView: View {
	let movie: Movie
	//	@State private var selectedTrailer: MovieVideo?
	let imageLoader = ImageLoader()

	var body: some View {
		List {
			// intro
			ZStack {
				MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL)
					.blur(radius: 10)

				VStack(alignment: .center, spacing: 0) {
					MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL)
						.frame(width: 200, height: 200)
						.frame(minWidth:0, maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
					
					Spacer(minLength: 10)

					HStack(alignment: .center, spacing: 5) {
						Text("94% Match").foregroundColor(Color.green)
							.font(.system(size: 14))
							.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 5))
							.shadow(color: .green, radius: 10)
						Text(movie.yearText)
							.font(.system(size: 14))
							.foregroundColor(Color.white)
							.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 5))
							.shadow(color: .green, radius: 10)
						Text("7+")
							.font(.system(size: 14))
							.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 5))
							.shadow(color: .green, radius: 10)
							.foregroundColor(Color.white)
						Text(movie.durationText)
							.font(.system(size: 14))
							.foregroundColor(Color.white)
							.shadow(color: .green, radius: 10)
					}.frame(minWidth: 0, maxWidth: .infinity)

					Spacer(minLength: 10)

					//button
					ButtonView()

				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
					.listRowSeparator(.hidden)
			}
			.listRowBackground(Color.black)

			//overview
			VStack {
				Text(movie.overview)
					.foregroundColor(Color.white)
			}.frame(minWidth: 0,
					maxWidth: .infinity)
				.listRowBackground(Color.black)

			//Rating
			HStack {
				if !movie.ratingText.isEmpty {
					Text(movie.ratingText).foregroundColor(.green)
				}
				Text(movie.scoreText)
			}
			.foregroundColor(Color.white)
			.padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
			.listRowBackground(Color.black)

			//starring & director
			HStack{
				Text("Starring: ")
					.font(.system(size: 20).bold())
				if let cast = self.movie.cast {
					ForEach(0..<cast.count) { i in
						if i == 0 {
							Text(cast[i].name).lineLimit(1)
							Text(",")
						} else if i == (cast.count - 1) {
							Text(cast[i].name).lineLimit(1)
						}
					}
				}
			}.listRowSeparator(.hidden)
				.listRowBackground(Color.black)
				.foregroundColor(Color.white)

			HStack{
				Text("Director: ").font(.system(size: 20).bold())
				if let director = self.movie.directors {
					ForEach(0..<director.count) { i in
						if i != (director.count - 1) {
							Text(director[i].name).lineLimit(1)
							Text(",")
						} else {
							Text(director[i].name).lineLimit(1)
						}
					}
//				ForEach((self.movie.directors?.prefix(2))!) { director in
//					Text(director.name)
//					Text(",")
				}
			}.foregroundColor(Color.white)
				.listRowBackground(Color.black)

			//Button
			HStack {
				Button {
					print("My list was tapped")
				} label: {
					Image(systemName: "checkmark")
					Text("My List")
				}.frame(minWidth: 0, maxWidth: .infinity)

				Button {
					print("Rated was tapped")
				} label: {
					Image(systemName: "hand.thumbsup")
					Text("Rate")
				}.frame(minWidth: 0, maxWidth: .infinity)

				Button {
					print("Shared was tapped")
				} label: {
					Image(systemName: "shareplay")
					Text("Share")
				}.frame(minWidth: 0, maxWidth: .infinity)

				Button {
					print("Shared was tapped")
				} label: {
					Text("")
				}.frame(minWidth: 0, maxWidth: .infinity)
			}.foregroundColor(Color.white)
				.listRowBackground(Color.black)
		}.listStyle(PlainListStyle())
			.background(Color.black)
	}
}

struct NavigationConfigurator: UIViewControllerRepresentable {
	var configure: (UINavigationController) -> Void = { _ in }

	func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
		UIViewController()
	}
	func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
		if let nc = uiViewController.navigationController {
			self.configure(nc)
		}
	}
}

struct MovieDetailImage: View {

	@ObservedObject var imageLoader: ImageLoader
	let imageURL: URL

	var body: some View {
		ZStack {
			Rectangle().fill(Color.gray.opacity(0.3))
			if self.imageLoader.image != nil {
				Image(uiImage: self.imageLoader.image!)
				.resizable()			}
		}
		.onAppear {
			self.imageLoader.loadImage(with: self.imageURL)
		}
	}
}

struct ButtonView: View {
	var body: some View {
		Button {
			print("Play was tapped")
		} label: {
			Label("PLAY", systemImage: "play.fill")
				.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 35))
		}
		.buttonStyle(PlainButtonStyle())
		.frame(width: 300.0, height: 40, alignment: .center)
		.background(Color.white)
		.foregroundColor(Color.black)
		.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 5))

		Spacer()

		Button {
			print("Download was tapped")
		} label: {
			Label("DOWNLOAD", systemImage: "square.and.arrow.down")
				.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
		}
		.buttonStyle(PlainButtonStyle())
		.frame(width: 300.0, height: 40, alignment: .center)
		.background(Color.gray)
		.foregroundColor(Color.white)
		.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 5))
	}
}

struct MovieDetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			MovieDetailView(movieId: Movie.stubbedMovie.id)
		}
	}
}


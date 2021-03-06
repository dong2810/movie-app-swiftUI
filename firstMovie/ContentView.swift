//
//  ContentView.swift
//  firstMovie
//
//  Created by đông on 07/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			MovieListView()
				.tabItem {
					VStack {
						Image(systemName: "tv")
						Text("Movies")
					}
			}
			.tag(0)

			MovieSearchView()
				.tabItem {
					VStack {
						Image(systemName: "magnifyingglass")
						Text("Search")
					}
			}
			.tag(1)

			MovieFavouriteView()
				.tabItem {
					VStack {
						Image(systemName: "heart")
						Text("Favourite")
					}
				}

		}.accentColor(Color.red)
//			.tabViewStyle(PageTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

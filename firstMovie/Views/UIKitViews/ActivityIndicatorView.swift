//
//  ActivityIndicatorView.swift
//  firstMovie
//
//  Created by đông on 10/12/2021.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

	func makeUIView(context: Context) -> UIActivityIndicatorView {
		let view = UIActivityIndicatorView(style: .large)
		view.startAnimating()
		return view
	}
}

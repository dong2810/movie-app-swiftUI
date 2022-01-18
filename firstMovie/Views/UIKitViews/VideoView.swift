//
//  VideoView.swift
//  firstMovie
//
//  Created by đông on 16/01/2022.
//

import SwiftUI
import SafariServices

struct VideoView: UIViewControllerRepresentable {
	let url : URL

	func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

	}

	func makeUIViewController(context: Context) -> SFSafariViewController {
		let videoVC = SFSafariViewController(url: self.url)
		return videoVC
	}
}

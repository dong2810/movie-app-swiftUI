//
//  SideMenu.swift
//  firstMovie
//
//  Created by đông on 10/02/2022.
//

import SwiftUI

struct SideMenu: View {
    var body: some View {
		Text("Hello, SwiftUI")
					.modifier(PrimaryLabel())
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

struct PrimaryLabel: ViewModifier {
	func body(content: Content) -> some View {
		content
//			.padding()
			.background(Color.red)
//			.foregroundColor(Color.white)
//			.font(.largeTitle)
	}
}

//
//  MessageView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct MessageView: View {
    @State private var isOn : Bool = false
    var body: some View {
        VStack {
            Text("Binding Demo")
                .font(.title)
                .foregroundColor(isOn ? .green : .gray)
            
            Text("SwiftUI")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ToggleChildView(isOn: $isOn)
        }

    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

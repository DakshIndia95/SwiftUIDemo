//
//  ToggleChildView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 08/08/23.
//

import SwiftUI

struct ToggleChildView: View {
    @Binding var isOn : Bool
    
    var body: some View {
        VStack {
            Toggle("Is Watching", isOn: $isOn).fixedSize()
        }
    }
}

struct ToggleChildView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleChildView(isOn: .constant(false))
    }
}

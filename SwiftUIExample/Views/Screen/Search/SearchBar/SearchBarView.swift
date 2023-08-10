//
//  SearchBarView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    @Binding var searchBarText: String
    typealias UIViewType = UISearchBar
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchBarText
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchBarText)
    }
    
    class Coordinator : NSObject, UISearchBarDelegate {
        @Binding var searchBarValue: String
        
        init(text: Binding<String>){
            _searchBarValue = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarValue = searchText
        }
    }

}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchBarText: .constant(""))
    }
}

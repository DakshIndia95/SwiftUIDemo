//
//  SearchView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct SearchView: View {
    let cricketers = JSONHelper.loadCricketerJsonDataFromFile()
    @State var searchBarText: String
    
    var body: some View {
        
        VStack {
            SearchBarView(searchBarText: $searchBarText)
            
            List {
                ForEach(cricketers.filter({searchBarText.isEmpty ? true : $0.name.contains(searchBarText)}),id: \.id) { cricketer in
                    SearchCell(cricketer: cricketer)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchBarText: "")
    }
}

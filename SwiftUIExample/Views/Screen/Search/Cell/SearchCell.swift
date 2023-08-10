//
//  SearchCell.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct SearchCell: View {
    var cricketer: Cricketer
    var body: some View {
        HStack {
            Image(cricketer.image)
                .resizable()
                .frame(width: 50,height: 50,alignment: .center)
            Text(cricketer.name).font(.headline)
            Spacer()
        }
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell(cricketer: Cricketer(id: 1, name: "Sachin", email: "sachin@gmail.com", age: 40, birth_date: "04/09/1995", phone: "8787676767", website: "sachin@gmail.com", image: "sachin"))
    }
}

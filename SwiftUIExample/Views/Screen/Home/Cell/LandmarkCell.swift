//
//  LandmarkCell.swift
//  SwiftUIExample
//
//  Created by Neosoft on 08/08/23.
//

import SwiftUI

struct LandmarkCell: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.photo)
                .resizable()
                .frame(width: 50,height: 50,alignment: .center)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkCell_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCell(landmark: Landmark(landmarkId: 1, name: "Gateway of India", photo: "goi", description: "The Gateway of India is an arch-monument built in the early twentieth century in the city of Mumbai, in the Indian state of Maharashtra. It was erected to commemorate the landing in December 1911 at Apollo Bunder, Mumbai (then Bombay) of King-Emperor George V and Queen-Empress Mary, the first British monarch to visit India."))
    }
}

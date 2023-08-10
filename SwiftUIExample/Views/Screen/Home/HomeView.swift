//
//  HomeView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct HomeView: View {
    
    let cities = JSONHelper.loadCityJsonDataFromFile()

    var body: some View {
        NavigationView {
            List {
                ForEach(cities,id: \.cityId) {city in
                    Section {
                        ForEach(city.landmarks,id: \.landmarkId) { landmark in
                            
                            NavigationLink(destination: DetailView(landmark: landmark)) {
                                LandmarkCell(landmark: landmark)
                            }
                        }
                    } header: {
                        Text(city.name)
                    }

                }
            }.navigationBarTitle("Landmark")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

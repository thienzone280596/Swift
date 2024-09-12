//
//  ContentView.swift
//  Hello-Maps
//
//  Created by Mohammad Azam on 7/31/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager = LocationManager.shared
    @State private var selectedMapOption: MapOptions = .standard
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Map(position: $position) {
                Annotation("Coffee", coordinate: .coffee) {
                    Image(systemName: "cup.and.saucer.fill")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .cornerRadius(4.0)
                }
                
                Annotation("Restaurant", coordinate: .restaurant) {
                    Image(systemName: "fork.knife.circle")
                }
                
                UserAnnotation()
            }
            .mapControls{
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .mapStyle(selectedMapOption.mapStyle)
            .onChange(of: locationManager.region) {
                withAnimation {
                    position = .region(locationManager.region)
                }
            }
            /*
            Picker("Map Styles", selection: $selectedMapOption) {
                ForEach(MapOptions.allCases) { mapOption in
                    Text(mapOption.rawValue.capitalized).tag(mapOption)
                }
            }.pickerStyle(.segmented)
            .background(.white)
            .padding([.top], 60) */
            
            VStack {
                Spacer()
                HStack {
                    Button("Coffee") {
                        withAnimation {
                            position = .region(.coffee)
                        }
                    }.buttonStyle(.borderedProminent)
                    .tint(.brown)
                    Button("Restaurant") {
                        withAnimation {
                            position = .region(.restaurant)
                        }
                    }.buttonStyle(.borderedProminent)
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}


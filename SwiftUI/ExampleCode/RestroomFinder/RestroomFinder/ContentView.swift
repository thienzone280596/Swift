//
//  ContentView.swift
//  RestroomFinder
//
//  Created by Mohammad Azam on 8/25/23.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @Environment(\.httpClient) private var restroomClient
    @State private var locationManager = LocationManager.shared
    @State private var restrooms: [Restroom] = []

    private func loadRestrooms() async {

        guard let region = locationManager.region else { return }
        let coordinate = region.center

        do {
          restrooms = try await restroomClient.fetchRestrooms(url: Constants.Urls.restroomsByLocation(latutude: coordinate.latitude, longtitude: coordinate.longitude))
        } catch {
            print(error.localizedDescription)
        }

    }

    var body: some View {
        ZStack {
            Map {
                ForEach(restrooms) { restroom in
                    Marker(restroom.name, coordinate: restroom.coordinate)
                }

                UserAnnotation()
            }
        }.task(id: locationManager.region) {
            await loadRestrooms()
        }
    }
}

#Preview {
    ContentView()
        .environment(\.httpClient, MockRestroomClient())
}

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
    @State private var selectedRestroom: Restroom?
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)

    private func loadRestrooms() async {

        guard let region = visibleRegion else { return }
        let coordinate = region.center

        do {
          restrooms = try await restroomClient.fetchRestrooms(url: Constants.Urls.restroomsByLocation(latutude: coordinate.latitude, longtitude: coordinate.longitude))
        } catch {
            print(error.localizedDescription)
        }

    }

    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(restrooms) { restroom in
                    Annotation(restroom.name, coordinate: restroom.coordinate) {
                        Text("🚻")
                            .scaleEffect(selectedRestroom == restroom ? 2.0: 1.0)
                            .font(.title)
                            .onTapGesture {
                                withAnimation {
                                    selectedRestroom = restroom
                                }
                            }
                            .animation(.spring(duration: 0.25), value: selectedRestroom)
                    }
                }

                UserAnnotation()
            }
        }.task(id: locationManager.region) {
            print("region changed")
          if let region = locationManager.region {
            visibleRegion = region
          }
            await loadRestrooms()
        }
        .onMapCameraChange({ context in
            print("onMapCameraChange")
            visibleRegion = context.region
        })
        .sheet(item: $selectedRestroom, content: { restroom in
          RestroomDetailView(restroom: restroom)
            .presentationDetents([.fraction(0.25)])
            .padding()
        })
        .overlay(alignment: .topLeading) {
            Button {
                Task {
                    await loadRestrooms()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white, .blue)

            }.padding()
        }
    }
}

#Preview {
    ContentView()
        .environment(\.httpClient, RestroomClient())
}

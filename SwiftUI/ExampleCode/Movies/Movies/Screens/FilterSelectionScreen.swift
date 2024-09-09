//
//  FilterSelectionScreen.swift
//  Movies
//
//  Created by ThienTran on 7/9/24.
//

import SwiftUI

enum FilterOption {
  case title(String)
  case reviewsCount(Int)
  case genre(Genre)
  case none
}

struct FilterSelectionScreen: View {
  @State private var movieTitle:String = ""
  @State private var numberOfReviews:Int?
  @State private var genre:Genre = .action
  @Environment(\.dismiss) private var dismiss
  @Binding var filterOption:FilterOption


    var body: some View {
      Form {
        Section("Filter by Title") {
          TextField("Movie title", text: $movieTitle)
          Button("Save") {
            filterOption = .title(movieTitle)
            dismiss()
          }
        }
        //filter by reviews
        Section("Filter number of reviews") {
          TextField("Movie title", value: $numberOfReviews, format: .number)
            .keyboardType(.numberPad)
          Button("Save") {
            filterOption = .reviewsCount(numberOfReviews ?? 1)
            dismiss()
          }
        }
        //filter by genre
        Section("Filter by Genre") {
          Picker("Filter Genre", selection: $genre) {
            ForEach(Genre.allCases) {
              genre in
              Text(genre.title).tag(genre)
            }
          }
          .onChange(of: genre) {
            filterOption = .genre(genre)
            dismiss()
          }
          Button("Save") {
            dismiss()
          }
        }
      }
    }
}

#Preview {
  FilterSelectionScreen(filterOption: .constant(.title("Batman")))
}

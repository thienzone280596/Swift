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
  case none
}

struct FilterSelectionScreen: View {
  @State private var movieTitle:String = ""
  @State private var numberOfReviews:Int?
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
        Section("Filter number of reviews") {
          TextField("Movie title", value: $numberOfReviews, format: .number)
            .keyboardType(.numberPad)
          Button("Save") {
            filterOption = .reviewsCount(numberOfReviews ?? 1)
            dismiss()
          }
        }
      }
    }
}

#Preview {
  FilterSelectionScreen(filterOption: .constant(.title("Batman")))
}

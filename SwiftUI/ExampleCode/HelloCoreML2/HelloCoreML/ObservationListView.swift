//
//  ObservationListView.swift
//  HelloCoreML
//
//  Created by ThienTran on 20/9/24.
//

import SwiftUI

struct ObservationListView: View {
  let observations:[Observation]
    var body: some View {
      List(observations, id: \.label) {
        observation in
        HStack {
          Text(observation.label)
          Spacer()
          Text(NSNumber(value: observation.confidence), formatter: NumberFormatter.percentage)
        }
      }
    }
}

#Preview {
  ObservationListView(observations: [])
}

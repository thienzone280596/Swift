//
//  ContentView.swift
//  HelloCoreML
//
//  Created by Mohammad Azam on 5/19/23.
//

import SwiftUI
import CoreML
import PhotosUI
import Vision

struct Observation {
  let label:String
  let confidence:VNConfidence
  let boundingBox:CGRect
}

struct ContentView: View {
    
    @State private var probs: [String: Double] = [: ]
    @State private var uiImage: UIImage? = UIImage(named: "stop-sign")
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var isCameraSelected: Bool = false
    @State private var detectedObjects:[Observation] = []

    let model = try! YOLOv3Tiny(configuration: MLModelConfiguration())

    var body: some View {
        
        VStack {
            
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                
            HStack {
                
                PhotosPicker(selection: $selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                   Text("Select a Photo")
                }
                
                Button("Camera") {
                    isCameraSelected = true
                }.buttonStyle(.bordered)
            }
            
            Button("Predict") {
              let mlModel = model.model

              guard let coreModel = try? VNCoreMLModel(for: mlModel) else {return}

              let request = VNCoreMLRequest(model: coreModel) { request, error in
                guard let results = request.results as? [VNRecognizedObjectObservation] else { return }
                detectedObjects = results.map {result in
                 guard let label = result.labels.first?.identifier else {return Observation(label: "", confidence: VNConfidence.zero, boundingBox: .zero)}
                  let confidence = result.labels.first?.confidence  ?? 0.0
                  let boundedBox = result.boundingBox
                  let observation  = Observation(label: label, confidence: confidence, boundingBox: boundedBox)
                  print(label)
                  print("\(confidence)")
                  print("\(boundedBox)")
                  return observation
                }
              }
              guard let image = uiImage,
                    let pixelBuffer = image.toCVPixelBuffer() else { return }
              let requestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
              do {
                try requestHandler.perform([request])
              } catch {
                print(error.localizedDescription)
              }
            }.buttonStyle(.borderedProminent)
            
           
        }
        .onChange(of: selectedPhotoItem, perform: { selectedPhotoItem in
           
            selectedPhotoItem?.loadTransferable(type: Data.self, completionHandler: { result in
                print(result)
                switch result {
                    case .success(let data):
                        if let data {
                            uiImage = UIImage(data: data)
                        }
                            
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            })
        })
        .sheet(isPresented: $isCameraSelected, content: {
            ImagePicker(image: $uiImage, sourceType: .camera)
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

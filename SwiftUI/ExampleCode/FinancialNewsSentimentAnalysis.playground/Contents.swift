import Cocoa
import CreateML
import TabularData

let csvFile = Bundle.main.url(forResource: "all-data", withExtension: "csv")!
let dataFrame = try DataFrame(contentsOfCSVFile: csvFile)

let classifier = try MLTextClassifier(trainingData: dataFrame, textColumn: "text", labelColumn: "sentiment")
let metaData = MLModelMetadata(author: "Thien Tran", shortDescription: "Predicts the sentiments associated with financial news", version: "1.0")
try classifier.write(toFile: "/Users/thientran/Desktop/FinancialNewsSentimentAnalysis.mlmodel", metadata: metaData)


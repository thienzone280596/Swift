import Cocoa
import CreateML
import TabularData


let fileURL = Bundle.main.url(forResource: "carvana", withExtension: "csv")!
let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")

let formattingOptions = FormattingOptions(maximumLineWidth: 250, maximumCellWidth: 250, maximumRowCount: 30, includesColumnTypes: true)

let calendar = Calendar.current
let currentYear = calendar.component(.year, from: Date())

let dataFrame = try DataFrame(contentsOfCSVFile: fileURL, options: options)

let dataSliceUnder60KMiles = dataFrame.filter(on: "Miles", Int.self) { miles in
    guard let miles = miles else { return false }
    return miles <= 60000
}

let dataSliceFrameLessThan5YearsOld = dataSliceUnder60KMiles.filter(on: "Year", Int.self) { year in
    guard let year = year else { return false }
    return currentYear - year >= 0 && currentYear - year <= 5
}

let dataSliceHondaAndToyota = dataSliceFrameLessThan5YearsOld.filter(on: "Name", String.self) { name in
    guard let name = name else { return false }
    return name.contains("Toyota") || name.contains("Honda")
}


print(dataSliceHondaAndToyota.description(options: formattingOptions))

let carvanaDataFrame = DataFrame(dataSliceHondaAndToyota)

let regressor = try MLRegressor(trainingData: carvanaDataFrame, targetColumn: "Price")

let metaData = MLModelMetadata(author: "Mohammad Azam", shortDescription: "Carvana Model", license: nil, version: "1.0", additional: nil)

try regressor.write(toFile: "/Users/azamsharp/Desktop/Carvana.mlmodel", metadata: metaData)

let nameDataFrame = carvanaDataFrame.selecting(columnNames: ["Name"])
let nameColumnSlice = nameDataFrame["Name"].distinct()
let uniqueNames: [String] = nameColumnSlice.compactMap { ($0 as? String)?.trimmingCharacters(in: .whitespacesAndNewlines) }

let nameColumn = Column(name: "name", contents: uniqueNames)

var uniqueNameDataFrame = DataFrame()
uniqueNameDataFrame.append(column: nameColumn)

print(uniqueNameDataFrame)

// write to a JSON file
try uniqueNameDataFrame.writeJSON(to: URL(filePath: "/Users/azamsharp/Desktop/CarNames.json"))

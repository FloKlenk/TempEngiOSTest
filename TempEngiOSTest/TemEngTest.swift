////
////  TemEngTest.swift
////  TempEngiOSTest
////
////  Created by Florian Klenk
////
//
//import SwiftUI
//
//// Datenmodelle
//struct Template {
//    var name: String
//    var operations: [Operation]
//}
//
//struct Operation {
//    var type: String
//    var parameters: [String: Any]
//}
//
//struct PlaceholderData {
//    var name: String
//    var value: Any
//}
//
//struct TemEngTest: View {
//        @State private var selectedTemplate: Template?
//        @State private var inputData: [PlaceholderData] = [
//            PlaceholderData(name: "SensorA", value: 100),
//            PlaceholderData(name: "SensorB", value: 205)
//        ]
//        @State private var resultData: [Int] = [] // Verwende Int als Identifikation
//
//        var body: some View {
//            VStack {
//                Text("Select a Template:")
//                
//                Button("Template 1") {
//                    selectedTemplate = Template(name: "Template 1", operations: [
//                        Operation(type: "Berechnung", parameters: ["factor": 223]),
//                        Operation(type: "Filter", parameters: ["threshold": 1523])
//                    ])
//                    applyTemplate()
//                }
//                
//                Button("Template 2") {
//                    selectedTemplate = Template(name: "Template 2", operations: [
//                        Operation(type: "Filter", parameters: ["threshold": 102212])
//                    ])
//                    applyTemplate()
//                }
//                
//                Spacer()
//                
//                if !resultData.isEmpty {
//                    Text("Results:")
//                    List(resultData, id: \.self) { itemID in
//                        // Hier kannst du die Elemente basierend auf itemID darstellen.
//                        // Du kannst auf die originalen Ergebnisse anhand der itemID zugreifen.
//                        Text("\(resultData[itemID])")
//                    }
//                }
//            }
//        }
//        
//        func applyTemplate() {
//            if let template = selectedTemplate {
//                // Apply the template to input data
//                let result = applyTemplate(template: template, toData: inputData)
//                resultData = Array(result.indices)
//                
//                // Display the results or navigate to a results view.
//            }
//        }
//        
//        func applyTemplate(template: Template, toData data: [PlaceholderData]) -> [Any] {
//            var resultData: [Any] = []
//            
//            for operation in template.operations {
//                if operation.type == "Berechnung" {
//                    if let factor = operation.parameters["factor"] as? Int {
//                        resultData = data.map { item in
//                            if item.name == "SensorA" {
//                                return (item.value as! Int) * factor
//                            }
//                            return item.value
//                        }
//                    }
//                } else if operation.type == "Filter" {
//                    if let threshold = operation.parameters["threshold"] as? Int {
//                        resultData = data.filter { item in
//                            if item.name == "SensorA" {
//                                return (item.value as! Int) > threshold
//                            }
//                            return true
//                        }.map { item in item.value }
//                    }
//                }
//                // Weitere Operationen hinzufügen, je nach Bedarf.
//            }
//            
//            return resultData
//        }
//    }
//
//
//
//struct TemEngTest_Previews: PreviewProvider {
//    static var previews: some View {
//        TemEngTest()
//    }
//}

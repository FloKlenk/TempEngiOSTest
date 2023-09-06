////
////  TestDatenOperation.swift
////  TempEngiOSTest
////
////  Created by Florian Klenk
////
//
//import SwiftUI
//import Charts
//
//struct TestDatenOperation: View {
//        var selectedName: String
//        var selectedNote: String
//    //    @State private var age = 18
//        @State private var isAgeSelectionComplete = false
//    //    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
//        @State private var selectedDataOption = 0 // Neues @State-Attribut für die ausgewählten Sensordaten
//        @State private var selectedOperationOption = 0 // Neues @State-Attribut für die ausgewählte Operation
//        var Daten: [[Double]]
//        var DatenNamen: [String]
//        var OperationsNamen: [String]
//    //    @State private var dataname = ""
//    //    @State private var Operationsname = ""
//        
//
//
//        var body: some View {
//            VStack {
//    //                        Stepper("Alter: \(age)", value: $age, in: 18...100)
//    //                            .padding()
//                Text("Auswahl der Sensordaten:")
//                Picker("Wählen Sie Daten", selection: $selectedDataOption) {
//                    ForEach(0..<DatenNamen.count, id: \.self) { index in
//                        Text(DatenNamen[index])
//                    }}
//                .padding()
//                
//                Button("Speichern2") {
//                    // Hier kannst du die Auswahl speichern, z.B. in einem Array
//                    // In diesem Beispiel wird die Auswahl nur im Speicher gehalten
//                    isAgeSelectionComplete = true
////                    let selectedDataName = DatenNamen[selectedDataOption]
////                            let selectedOperationName = OperationsNamen[selectedOperationOption]
//    
//                }
//                .padding()
//                
//                }
//                        if isAgeSelectionComplete {
//                            let selectedDataName = DatenNamen[selectedDataOption]
//////                            let selectedOperationName = OperationsNamen[selectedOperationOption]
////
//                            Text(selectedDataName)
////                            Text("Gespeichert: " + selectedDataName + " mit der Operation " + selectedOperationName + " !")
////                                .font(.headline)
//                        }
////            .navigationTitle("Alter auswählen für \(selectedName)")
//        }
//    }
//
////View 3
//struct AgeSelectionView: View {
//    var selectedName: String
//    var selectedNote: String
////    @State private var age = 18
//    @State private var isAgeSelectionComplete = false
////    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
//    @State private var selectedDataOption = 0 // Neues @State-Attribut für die ausgewählten Sensordaten
//    @State private var selectedOperationOption = 0 // Neues @State-Attribut für die ausgewählte Operation
//    var Daten: [[Double]]
//    var DatenNamen: [String]
//    var OperationsNamen: [String]
////    @State private var dataname = ""
////    @State private var Operationsname = ""
//    
//
//
//    var body: some View {
//        VStack {
//            Text("Auswahl der Operation:")
//            Picker("Wählen Sie Daten", selection: $selectedOperationOption) {
//                ForEach(0..<OperationsNamen.count, id: \.self) { index in
////                    self.Operationsname = OperationsNamen[index]
//                    Text(OperationsNamen[index])
//                }}
//                
////            NavigationLink(destination: GraphViewTestVariabel(numbers: Daten, Titel: DatenNamen[selectedOption], Notiz: selectedNote)) {
////                Text("Speichern")
//////                                            isAgeSelectionComplete = true
////            }
//                        .padding()
////                        if isAgeSelectionComplete {
////                            Text("Gespeichert: \(selectedName) - \(options[selectedOption]) Jahre")
////                                .font(.headline)
////                        }
//            Button("Speichern2") {
//                // Hier kannst du die Auswahl speichern, z.B. in einem Array
//                // In diesem Beispiel wird die Auswahl nur im Speicher gehalten
//                isAgeSelectionComplete = true
//            }
//            .padding()
////            if isAgeSelectionComplete {
////                let selectedDataName = DatenNamen[selectedDataOption]
////                let selectedOperationName = OperationsNamen[selectedOperationOption]
////
////                Text (selectedDataName)
////                Text("Gespeichert: " + selectedDataName + " mit der Operation " + selectedOperationName + " !")
////                    .font(.headline)
////            }
//            
//            }
//        .navigationTitle("Alter auswählen für \(selectedName)")
//    }
//}
//
//
////
////struct AnzeigeView: View {
////    var Daten: String
////    var Operation: String
////    @Binding var DatenUndOperation: [String]
////    @State private var isNewDataAndOperations = false
//////    var AnzeigeName = Daten + Operation
//////    DatenUndOperation.append(AnzeigeName)
////
////
////        var body: some View {
////            NavigationView {
////                VStack {
////                    List(DatenUndOperation, id: \.self) { name in
////                        Text(name)
////                    }
////
////                    Text("Dies ist ein Test")
////
////                    Button("Weitere Daten und Operation hinzufügen") {
////                        isNewDataAndOperations = true
////                    }
////
//////                    Button("Template speichern") {
////////                        isNameSelectionPresented = true
//////                    }
////                }
////                .navigationTitle("Aktuelle Daten und Operationen")
////
////                .sheet(isPresented: $isNewDataAndOperations) {
////                    TestDatenOperation()
////                }
////            }
////        }
////}
//
//
//struct GraphViewTestVariabel: View {
//    let numbers: [[Double]]
////    let NamenNumbers: [String]
//    let Titel: String
//    let Notiz: String
//
//    var body: some View {
//        VStack {
//            Text(Titel)
//                .font(.title)
//            Text(Notiz)
//                .font(.title2)
//
////                        Text("Durchschnitt: \(average)")
//            ScrollView{
//                Chart {
//
//                ForEach(Array(numbers.enumerated()), id: \.offset) { rowIndex, row in
//                        ForEach(Array(row.enumerated()), id: \.offset){ columnIndex, value in
//                            LineMark(
//                                x: .value("Index", columnIndex),
//                                y: .value("Value", value)
//                            )
////                            .foregroundStyle(by: .value("Daten", NamenNumbers[rowIndex]))
//                        }
//                    }
//                }
//                .frame(height: 600)
//
//            }
//        }
//    }
//}
//
//
//func multiplyByTwo(_ data: [Double]) -> [Double] {
//        return data.map { $0 * 2 }
//    }
//
//func dividedByTwo(_ data: [Double]) -> [Double] {
//    return data.map { $0 * 0.5 }
//    }
//
//func calculateAverage(_ data: [Double]) -> Double {
//        let sum = data.reduce(0, +)
//        return Double(sum) / Double(data.count)
//    }
//
//func integrateData(_ data: [Double]) -> [Double] {
//        var integratedData = [Double]()
//    var sum = 0.0
//        for value in data {
//            sum += value
//            integratedData.append(sum)
//        }
//        return integratedData
//    }
//
//
//
//struct TestDatenOperation_Previews: PreviewProvider {
//    static var previews: some View {
////        TestDatenOperation()
//        TestDatenOperation(selectedName: "ABC", selectedNote: "ABCDEF", Daten: [[27.0, 23.0, 9.0, 19.0, 24.0], [45.0, 22.0, 5.0, 12.0, 43.0], [32.0, 1.0, 41.0, 17.0, 48.0], [19.0, 11.0, 17.0, 8.0, 40.0], [14.0, 16.0, 19.0, 49.0, 42.0], [46.0, 11.0, 16.0, 42.0, 47.0]], DatenNamen: ["sensor1_x", "sensor1_y", "sensor1_z", "sensor2_x", "sensor2_y", "sensor2_z"], OperationsNamen: ["Original", "Mal 2", "Halbieren", "Integrieren"])
//    }
//}

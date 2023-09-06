////
////  EinzelTests.swift
////  TempEngiOSTest
////
////  Created by Florian Klenk
////
//
//import SwiftUI
//import Charts
//
//// View 1
//struct EinzelTests: View {
//    @ObservedObject var viewModel = DataViewModel()
//    @State private var names: [String] = []
////    @State private var namesStruct: [TestStruct] = []
//    @State private var notes: [String] = []
//    @State private var selectedName: String?
//    @State private var selectedNameStruct: TestStruct?
//    @State private var selectedAge: Int?
//    @State private var isNameSelectionPresented = false
//    @State private var isNoteSelectionPresented = false
//    @State private var isAgeSelectionPresented = false
//    @State private var sensor1_x = [27, 23, 9, 19, 24]
//    @State private var sensor1_y = [45, 22, 5, 12, 43]
//    @State private var sensor1_z = [32, 1, 41, 17, 48]
//    @State private var sensor2_x = [19, 11, 17, 8, 40]
//    @State private var sensor2_y = [14, 16, 19, 49, 42]
//    @State private var sensor2_z = [46, 11, 16, 42, 47]
//    @State public var NamenDatensaetze = ["sensor1_x", "sensor1_y", "sensor1_z", "sensor2_x", "sensor2_y", "sensor2_z"]
//    @State public var NamenOperationen = ["Original", "Mal 2", "Halbieren", "Integrieren"]
//    @State public var AlleDatensaetze = [[27.0, 23.0, 9.0, 19.0, 24.0], [45.0, 22.0, 5.0, 12.0, 43.0], [32.0, 1.0, 41.0, 17.0, 48.0], [19.0, 11.0, 17.0, 8.0, 40.0], [14.0, 16.0, 19.0, 49.0, 42.0], [46.0, 11.0, 16.0, 42.0, 47.0]]
////    var test = 0
////    if (test == 0) {
////        var TestData: TestStruct = TestStruct(name: "Test Struct", notiz: "Hier könnte ihre Werbung stehen", datensatz: [19.0, 11.0, 17.0, 8.0, 40.0])
////        viewModel.dataStructs.append(TestData)
////        test = 1
////    }
//
//    var body: some View {
//
//        NavigationView {
//            VStack {
////                Hier werden die Namen der Templates angezeigt. MIT FUNKTION!
//                  Text("Hier wird es angezeigt, wenn es wirklich gespeichert ist! + Interaktion")
//                List(viewModel.dataStructs) { dataStruct in
//                    Button(action: {
//                        selectedNameStruct = dataStruct // Hier weisen wir das ausgewählte TestStruct zu
//                    }) {
//                        Text(dataStruct.name)
//                    }
//                }
//                .sheet(item: $selectedNameStruct) { selectedStruct in
//                    GraphViewStruct(teststruct: selectedStruct)
//                }
////            }
////            VStack {
////                Hier werden nur die Namen der Templates angezeigt
//                Text("Nur Namen, keine Interaktion")
//                List(names, id: \.self) { name in
//                    Text(name)
//                }
//                Button("Hinzufügen, bearbeiten und anzeigen") {
//                    isNameSelectionPresented = true
//                }
//            }
//            .navigationTitle("Templates")
//
//            
////            DAS HIER ALS LETZTES AUSKOMMENTIERT!!!
//            .sheet(isPresented: $isNameSelectionPresented) {
//                NameSelectionView(names: $names, notes: $notes, isNameSelectionPresented: $isNameSelectionPresented, isNoteSelectionPresented: $isNoteSelectionPresented, AlleDaten: AlleDatensaetze, DatenNamen: NamenDatensaetze, OperationsNamen: NamenOperationen, viewModel: viewModel)
//            }
//        }
//    }
//}
//// View 2
//struct NameSelectionView: View {
//    @Binding var names: [String]
//    @Binding var notes: [String]
//    @Binding var isNameSelectionPresented: Bool
//    @Binding var isNoteSelectionPresented: Bool
//    @State private var name = ""
//    @State private var note = ""
//    var AlleDaten: [[Double]]
//    var DatenNamen: [String]
//    var OperationsNamen: [String]
//    @ObservedObject var viewModel: DataViewModel
//
//
//    
//    
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Name eingeben", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                
//                TextField("Notiz eingeben", text: $note)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                Button("Template hinzufügen") {
//                    names.append(name)
//                    name = ""
//                    isNameSelectionPresented = false
//                    notes.append(note)
//                    note = ""
//                    isNoteSelectionPresented = false
//                }
//                List(names, id: \.self) { name in
//                    NavigationLink(
//                        destination: AgeSelectionView(selectedName: name, selectedNote: note, Daten: AlleDaten, DatenNamen: DatenNamen, OperationsNamen: OperationsNamen, viewModel: viewModel)
////                        destination: GraphViewTestVariabel(numbers: [[19.0, 11.0, 17.0, 8.0, 40.0], [46, 11, 16, 42, 47]], NamenNumbers: ["eins", "zwei"], Titel: name, Notiz: note)
//
//                    ) {
//                        Text(name)
//                    }
//                }
//            }
//            .navigationTitle("Namen auswählen")
//        }
//    }
//}
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
//    @ObservedObject var viewModel: DataViewModel
//
//    
//
//
//    var body: some View {
//        VStack {
////                        Stepper("Alter: \(age)", value: $age, in: 18...100)
////                            .padding()
//            Text("Auswahl der Sensordaten:")
//            Picker("Wählen Sie Daten", selection: $selectedDataOption) {
//                ForEach(0..<DatenNamen.count, id: \.self) { index in
//                    Text(DatenNamen[index])
//                }}
////            .padding()
//            
////            Text("Auswahl der Operation:")
////            Picker("Wählen Sie eine Option", selection: $selectedOperationOption) {
////                ForEach(0..<OperationsNamen.count, id: \.self) { index in
//////                    self.Operationsname = OperationsNamen[index]
////                    Text(OperationsNamen[index])
////                }}
//            
//            
//                
////            NavigationLink(destination: GraphViewTestVariabel(numbers: Daten, Titel: DatenNamen[selectedOption], Notiz: selectedNote, )) {
////                Text("Graph anzeigen")
//////                                            isAgeSelectionComplete = true
////            }
//            NavigationLink(destination: NextView(selectedName: selectedName, selectedNote: selectedNote, selectedDataset: Daten[selectedDataOption], NamenOperationen: OperationsNamen, viewModel: viewModel)) {
//                Text("Zu der Operationsauswahl")
//            }
////                        .padding()
////                        if isAgeSelectionComplete {
////                            Text("Gespeichert: \(selectedName) - \(options[selectedOption]) Jahre")
////                                .font(.headline)
////                        }
////            Button("Speichern2") {
////                // Hier kannst du die Auswahl speichern, z.B. in einem Array
////                // In diesem Beispiel wird die Auswahl nur im Speicher gehalten
////                isAgeSelectionComplete = true
////            }
////            .padding()
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
//        .navigationTitle("Sensordaten auswählen für \(selectedName)")
//    }
//}
//
//struct NextView: View {
//    let selectedName: String
//    let selectedNote: String
//    let selectedDataset: [Double] // Hier empfangen wir den ausgewählten Datensatz
//    let NamenOperationen: [String]
//    @State private var selectedOperationOption = 0 // Neues @State-Attribut für die ausgewählte Operation
//    @State private var resultData: [Double] = []
//    @ObservedObject var viewModel: DataViewModel
//
//    func performOperation() {
//        switch NamenOperationen[selectedOperationOption] {
//        case "Original":
//            resultData = Original(selectedDataset)
//        case "Mal 2":
//            resultData = multiplyByTwo(selectedDataset)
//        case "Halbieren":
//            resultData = dividedByTwo(selectedDataset)
//        case "Integrieren":
//            resultData = integrateData(selectedDataset)
//        default:
//            break
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text("In NextView:")
//            Text("Ausgewählter Datensatz:")
//            
//            // Konvertieren Sie den ausgewählten Datensatz in einen lesbaren Text
//            ForEach(selectedDataset, id: \.self) { value in
//                Text("\(value)")
//            }
//            
//                        Text("Auswahl der Operation:")
//                        Picker("Wählen Sie eine Option", selection: $selectedOperationOption) {
//                            ForEach(0..<NamenOperationen.count, id: \.self) { index in
//                                Text(NamenOperationen[index])
//                            }}
//            
//            Button("Berechnen und in Struct speichern!") {
//                performOperation()
//
//                if let index = viewModel.dataStructs.firstIndex(where: { $0.name == selectedName }) {
//                    // Füge die resultierenden Daten zum Datensatz des ausgewählten TestStruct hinzu
//                    viewModel.dataStructs[index].datensatz.append(resultData)
//                    //                } else {
//                    //                    let newDataStructure = TestStruct(name: selectedName, notiz: selectedNote,datensatz: resultData)
//                    //                    viewModel.dataStructs.append(newDataStructure)
//                    //                }
//                } else {
//                            // Das ausgewählte TestStruct existiert nicht, erstelle ein neues mit einem leeren inneren Array
//                            var newDataStructure = TestStruct(name: selectedName, notiz: selectedNote)
//                            newDataStructure.datensatz[0].append(contentsOf: resultData)
//                            viewModel.dataStructs.append(newDataStructure)
//                        }
//            }
//
//            Text("Eingabedaten: \(selectedDataset.map { "\($0)" }.joined(separator: ", "))")
//            Text("Eingabedaten: \(resultData.map { "\($0)" }.joined(separator: ", "))")
//        }
//        NavigationLink(destination: GraphViewTestVariabel(numbers: [selectedDataset, resultData], Titel: "Titel1", Notiz: "Notiz1")) {
//            Text("Speichern und Anzeigen!")
//        }
//    }
//}
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
//struct GraphViewStruct: View {
//    let teststruct: TestStruct
//
//    var body: some View {
//        VStack {
//            Text(teststruct.name)
//                .font(.title)
//            Text(teststruct.notiz)
//                .font(.title2)
//            ScrollView {
//                     ForEach(0..<teststruct.datensatz.count, id: \.self) { columnIndex in
//                         let column = teststruct.datensatz[columnIndex]
//                         Chart {
//                         ForEach(0..<column.count, id: \.self) { rowIndex in
//                             let value = column[rowIndex]
//                             LineMark(
//                                 x: .value("Index", rowIndex),
//                                 y: .value("Value", value)
//                             )
//                         }
//                     }
//                 }
//                 .frame(height: 600)
//
//            }
//        }
//    }
//}
//
//
//struct EinzelTests_Previews: PreviewProvider {
//    static var previews: some View {
//        EinzelTests()
//    }
//}
//
//func Original(_ data: [Double]) -> [Double] {
//        return data.map { $0 * 1 }
//    }
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
//class DataViewModel: ObservableObject {
//    @Published var dataStructs = [TestStruct]()
//}
//
//struct TestStruct: Identifiable {
//    var id = UUID()
//    var name: String
//    var notiz: String
//    var datensatz: [[Double]]
//    
//    // Initialisierung mit einem leeren inneren Array
//    init(name: String, notiz: String) {
//        self.name = name
//        self.notiz = notiz
//        self.datensatz = [[]]
//    }
//}
//
//

//
//  EinzelTests.swift
//  TempEngiOSTest
//
//  Created by Florian Klenk
//
//  Aktuell eine variable Auswertung der Daten mit einem gespeicherten Graphen.
//  Es werden die nötigen Variablen in einem Struct (TestStruct) gespeichert und anschließend kann direkt darauf zugegriffen werden und der Graph angezeigt werden.
//
//  Funktionsweise:
//  Man erstellt eine neue Auswertung (Template), gibt Namen und Notiz ein, wählt anschließend einen Datensatz und eine Operation die darauf angewendet werden soll.
//  Dann kann das Template gespeichert und auf der Startseite der Graph direkt angezeigt werden.
//  Es können zu einer Auswertung beliebig viele Operationen zu beliebig vielen Datensätzen hinzugefügt werden, welche dann von der Startseite aus besser angezeigt werden können.
//



// Importieren der erforderlichen SwiftUI- und Charts-Bibliotheken
import SwiftUI
import Charts

// View 1: Die Hauptansicht
struct ContentView: View {
    // ViewModel, um Daten zu verwalten
    @ObservedObject var viewModel = DataViewModel()
    
    // Zustandsvariablen für UI-Interaktionen
    @State private var names: [String] = []
    @State private var notes: [String] = []
    @State private var selectedNameStruct: TestStruct?
    @State private var isNameSelectionPresented = false
    
    // Daten für verschiedene Sensoren
    @State private var sensor1_x = [27, 23, 9, 19, 24]
    @State private var sensor1_y = [45, 22, 5, 12, 43]
    @State private var sensor1_z = [32, 1, 41, 17, 48]
    @State private var sensor2_x = [19, 11, 17, 8, 40]
    @State private var sensor2_y = [14, 16, 19, 49, 42]
    @State private var sensor2_z = [46, 11, 16, 42, 47]
    
    // Daten und Operationen für Sensoren
    @State public var NamenDatensaetze = ["sensor1_x", "sensor1_y", "sensor1_z", "sensor2_x", "sensor2_y", "sensor2_z"]
    @State public var NamenOperationen = ["Original", "Mal 2", "Halbieren", "Integrieren"]
    @State public var AlleDatensaetze = [
        [27.0, 23.0, 9.0, 19.0, 24.0],
        [45.0, 22.0, 5.0, 12.0, 43.0],
        [32.0, 1.0, 41.0, 17.0, 48.0],
        [19.0, 11.0, 17.0, 8.0, 40.0],
        [14.0, 16.0, 19.0, 49.0, 42.0],
        [46.0, 11.0, 16.0, 42.0, 47.0]
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Anzeige für den ausgewählten Graphen (wird später aktualisiert)
                Text("Hier wird es angezeigt, wenn der Graph mit Daten gespeichert ist!")

                // Liste der Datenstrukturen
                List(viewModel.dataStructs) { dataStruct in
                    Button(action: {
                        selectedNameStruct = dataStruct // Das ausgewählte TestStruct zuweisen
                    }) {
                        Text(dataStruct.name)
                    }
                }
                .sheet(item: $selectedNameStruct) { selectedStruct in
                    GraphViewStruct(teststruct: selectedStruct)
                }

                // Anzeige der Namen (keine Interaktion)
                Text("Nur Namen zur Kontrolle, wenn das struct angelegt wurde, keine Interaktion")
                List(names, id: \.self) { name in
                    Text(name)
                }

                // Button, um Namen hinzuzufügen und zu bearbeiten
                Button("Hinzufügen und bearbeiten") {
                    isNameSelectionPresented = true
                }
            }
            .navigationTitle("Übersicht")
            .sheet(isPresented: $isNameSelectionPresented) {
                NameSelectionView(names: $names, notes: $notes, isNameSelectionPresented: $isNameSelectionPresented, AlleDaten: AlleDatensaetze, DatenNamen: NamenDatensaetze, OperationsNamen: NamenOperationen, viewModel: viewModel)
            }
        }
    }
}

// View 2: Name auswählen und hinzufügen
struct NameSelectionView: View {
    @Binding var names: [String]
    @Binding var notes: [String]
    @Binding var isNameSelectionPresented: Bool
    @State private var name = ""
    @State private var note = ""
    var AlleDaten: [[Double]]
    var DatenNamen: [String]
    var OperationsNamen: [String]
    @ObservedObject var viewModel: DataViewModel

    var body: some View {
        NavigationView {
            VStack {
                // Eingabefeld für den Namen
                TextField("Name eingeben", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Eingabefeld für die Notiz
                TextField("Notiz eingeben", text: $note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Button, um ein Template hinzuzufügen
                Button("Template hinzufügen") {
                    names.append(name)
                    name = ""
//                    isNameSelectionPresented = false
                    notes.append(note)
                    note = ""
                }

                // Liste der hinzugefügten Namen mit NavigationLink
                List(names, id: \.self) { name in
                    NavigationLink(
                        destination: DataSelectionView(selectedName: name, selectedNote: notes[names.firstIndex(of: name) ?? 0], Daten: AlleDaten, DatenNamen: DatenNamen, OperationsNamen: OperationsNamen, viewModel: viewModel)
                    ) {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Namen auswählen")
        }
    }
}

// View 3: Sensordaten auswählen
struct DataSelectionView: View {
    var selectedName: String
    var selectedNote: String
    @State private var selectedDataOption = 0
    var Daten: [[Double]]
    var DatenNamen: [String]
    var OperationsNamen: [String]
    @ObservedObject var viewModel: DataViewModel

    var body: some View {
        VStack {
            Text("Auswahl der Sensordaten:")
            
            // Picker zur Auswahl der Sensordaten
            Picker("Wählen Sie Daten", selection: $selectedDataOption) {
                ForEach(0..<DatenNamen.count, id: \.self) { index in
                    Text(DatenNamen[index])
                }
            }

            // Button, um zur Operationsauswahl zu gelangen
            NavigationLink(destination: NextView(selectedName: selectedName, selectedNote: selectedNote, selectedDataset: Daten[selectedDataOption], NamenOperationen: OperationsNamen, viewModel: viewModel)) {
                Text("Zu der Operationsauswahl")
            }
        }
        .navigationTitle("Sensordaten auswählen für \(selectedName)")
    }
}

// View 5: Nächste Ansicht, um eine Operation auf den ausgewählten Datensatz anzuwenden
struct NextView: View {
    let selectedName: String
    let selectedNote: String
    let selectedDataset: [Double]
    let NamenOperationen: [String]
    
    // Zustandsvariablen für UI-Interaktionen
    @State private var selectedOperationOption = 0
    @State private var resultData: [Double] = []
    
    // Das ViewModel für die Datenverwaltung
    @ObservedObject var viewModel: DataViewModel

    // Funktion zur Durchführung der ausgewählten Operation
    func performOperation() {
        switch NamenOperationen[selectedOperationOption] {
        case "Original":
            resultData = Original(selectedDataset)
        case "Mal 2":
            resultData = multiplyByTwo(selectedDataset)
        case "Halbieren":
            resultData = dividedByTwo(selectedDataset)
        case "Integrieren":
            resultData = integrateData(selectedDataset)
        default:
            break
        }
    }

    var body: some View {
        VStack {
            Text("In NextView:")
            Text("Ausgewählter Datensatz:")
            
            // Anzeige des ausgewählten Datensatzes
            ForEach(selectedDataset, id: \.self) { value in
                Text("\(value)")
            }
            
            Text("Auswahl der Operation:")
            
            // Picker zur Auswahl der Operation
            Picker("Wählen Sie eine Option", selection: $selectedOperationOption) {
                ForEach(0..<NamenOperationen.count, id: \.self) { index in
                    Text(NamenOperationen[index])
                }
            }
            
            // Button zum Ausführen der Operation und Speichern der Ergebnisse
            Button("Berechnen und in Struct speichern!") {
                performOperation()

                // Überprüfen, ob das ausgewählte TestStruct bereits existiert
                if let index = viewModel.dataStructs.firstIndex(where: { $0.name == selectedName }) {
                    // Füge die resultierenden Daten zum Datensatz des ausgewählten TestStruct hinzu
                    viewModel.dataStructs[index].datensatz.append(resultData)
                } else {
                    // Das ausgewählte TestStruct existiert nicht, erstelle ein neues mit einem leeren inneren Array
                    var newDataStructure = TestStruct(name: selectedName, notiz: selectedNote)
                    newDataStructure.datensatz[0].append(contentsOf: resultData)
                    viewModel.dataStructs.append(newDataStructure)
                }
            }

            // Anzeige der Eingabedaten und der Ergebnisdaten
            Text("Eingabedaten: \(selectedDataset.map { "\($0)" }.joined(separator: ", "))")
            Text("Ergebnisdaten: \(resultData.map { "\($0)" }.joined(separator: ", "))")
        }
        
        // NavigationLink zur Anzeige der Grafik
        NavigationLink(destination: GraphViewTestVariabel(numbers: [selectedDataset, resultData], Titel: "Titel1", Notiz: "Notiz1")) {
            Text("Speichern und Anzeigen!")
        }
    }
}


// View 5: Anzeige der Grafik für einen ausgewählten Datensatz
struct GraphViewTestVariabel: View {
    let numbers: [[Double]]
    let Titel: String
    let Notiz: String

    var body: some View {
        VStack {
            Text(Titel)
                .font(.title)
            Text(Notiz)
                .font(.title2)
            ScrollView {
                Chart {
                    ForEach(Array(numbers.enumerated()), id: \.offset) { rowIndex, row in
                        ForEach(Array(row.enumerated()), id: \.offset) { columnIndex, value in
                            LineMark(
                                x: .value("Index", columnIndex),
                                y: .value("Value", value)
                            )
                        }
                    }
                }
                .frame(height: 600)
            }
        }
    }
}

// View 6: Anzeige der Grafik für einen ausgewählten Datensatz in einem TestStruct
struct GraphViewStruct: View {
    let teststruct: TestStruct

    var body: some View {
        VStack {
            Text(teststruct.name)
                .font(.title)
            Text(teststruct.notiz)
                .font(.title2)
            ScrollView {
                Chart{
                ForEach(0..<teststruct.datensatz.count, id: \.self) { columnIndex in
                    let column = teststruct.datensatz[columnIndex]
//                    Chart {
                        ForEach(0..<column.count, id: \.self) { rowIndex in
                            let value = column[rowIndex]
                            LineMark(
                                x: .value("Index", rowIndex),
                                y: .value("Value", value)
                            )
                        }
                    }
//                    .frame(height: 600)
                }
                .frame(height: 600)
            }
        }
    }
}

// View-Vorschau für die Hauptansicht
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Funktionen zur Veränderung der Datenreihen
func Original(_ data: [Double]) -> [Double] {
    return data.map { $0 * 1 }
}

func multiplyByTwo(_ data: [Double]) -> [Double] {
    return data.map { $0 * 2 }
}

func dividedByTwo(_ data: [Double]) -> [Double] {
    return data.map { $0 * 0.5 }
}

func calculateAverage(_ data: [Double]) -> Double {
    let sum = data.reduce(0, +)
    return Double(sum) / Double(data.count)
}

func integrateData(_ data: [Double]) -> [Double] {
    var integratedData = [Double]()
    var sum = 0.0
    for value in data {
        sum += value
        integratedData.append(sum)
    }
    return integratedData
}

// ViewModel für die Verwaltung der Datenstrukturen
class DataViewModel: ObservableObject {
    @Published var dataStructs = [TestStruct]()
}

// Das TestStruct, das mit einem leeren Datensatz initialisiert wird
struct TestStruct: Identifiable {
    var id = UUID()
    var name: String
    var notiz: String
    var datensatz: [[Double]]
    
    // Initialisierung mit einem leeren Datensatz-Array
    init(name: String, notiz: String) {
        self.name = name
        self.notiz = notiz
        self.datensatz = [[]]
    }
}

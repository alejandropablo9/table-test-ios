//
//  ZTableInteractor.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class ZTableInteractor {
    let cells = [
        ZTableCellEntity(title: "Nombre", cellType: .INPUT),
        ZTableCellEntity(title: "Ver/Tomar Fotografía", cellType: .PICTURE),
        ZTableCellEntity(title: "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental).", cellType: .GRAPHICS)
    ]
    var presenter: ZTableOutputInteractorProtocol?
}
extension ZTableInteractor: ZTableInputInteractorProtocol {
    func getCells() {
        presenter?.updateCells(cells: self.cells)
    }
}

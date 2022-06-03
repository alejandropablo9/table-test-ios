//
//  ZTableEntity.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
enum CellType {
    case INPUT
    case PICTURE
    case GRAPHICS
}

struct ZTableCellEntity {
    var title: String
    var cellType: CellType
}

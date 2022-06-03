//
//  BranchesEntity.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
final class BranchesResponse: BaseGeneralResponse {
    /// Dirección
    public var data: [Branches]?
    /// Codificador de la entidad.
    /// - Parameter encoder: Entidad Encoder.
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        try container?.encode(self.data, forKey: .data)
    }
    /// Inicializador para decodificar.
    /// - Parameter decoder: Entidad Decoder
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.data = try values?.decodeIfPresent([Branches].self, forKey: .data)
    }
}
final class Branches: BaseEntity, ClassDescribing {
    /// Pregunta
    var ask: String
    /// Valores
    var valuesBrach: [BranchesDetail]
    private enum CodingKeys: String, CodingKey {
        case ask = "pregunta"
        case valuesBrach = "values"
    }
    /// Constructor de la clase.
    public override init() {
        ask = ""
        valuesBrach = []
        super.init()
    }
    /// Inicializador que crea la nueva instancia decodificando la respuesta de la función de enconde.
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ask = try values.decode(String.self, forKey: .ask)
        valuesBrach = try values.decode([BranchesDetail].self, forKey: .valuesBrach)
        try super.init(from: decoder)
    }
    /// Función que convierte la información al tipo marcado en el inicializador.
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ask, forKey: .ask)
        try container.encode(valuesBrach, forKey: .valuesBrach)
        try super.encode(to: encoder)
    }
}
final class BranchesDetail: BaseEntity, ClassDescribing {
    /// Pregunta
    var label: String
    /// Valor
    var value: Int
    private enum CodingKeys: String, CodingKey {
        case label
        case value
    }
    /// Constructor de la clase.
    public override init() {
        label = ""
        value = 0
        super.init()
    }
    /// Inicializador que crea la nueva instancia decodificando la respuesta de la función de enconde.
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        label = try values.decode(String.self, forKey: .label)
        value = try values.decode(Int.self, forKey: .value)
        try super.init(from: decoder)
    }
    /// Función que convierte la información al tipo marcado en el inicializador.
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(label, forKey: .label)
        try container.encode(value, forKey: .value)
        try super.encode(to: encoder)
    }
}

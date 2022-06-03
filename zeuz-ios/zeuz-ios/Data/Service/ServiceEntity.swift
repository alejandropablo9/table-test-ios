//
//  ServiceEntity.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
open class BaseEntity: Encodable, Decodable {
}
open class BaseGeneralResponse: Codable, ClassDescribing {
    /// Estatus de la respuesta del servicio.
    var status: Bool = false
    /// Llaves para codificar.
    public var container: KeyedEncodingContainer<CodingKeys>?
    /// Llaves para decodificar.
    public var values: KeyedDecodingContainer<CodingKeys>?
    /// Enumeración de llaves.
    public enum CodingKeys: String, CodingKey {
        /// Estatus de la respuesta del servicio.
        case status
        /// Información de respuesta
        case data
        /// Mensaje del servicio
        case message
        /// Errores
        case errors
        /// Información de la paginación
    }
    //// Constructor de la clase
    init() {}
    /// Codificador de la entidad.
    /// - Parameter encoder: Entidad Encoder.
    open func encode(to encoder: Encoder) throws {
       container = encoder.container(keyedBy: CodingKeys.self)
       try container?.encode(self.status, forKey: .status)
    }
    /// Inicializador de entidad por decodificación.
    /// - Parameter decoder: Entidad Decoder.
    required public init(from decoder: Decoder) throws {
        values = try decoder.container(keyedBy: CodingKeys.self)
        status = true
    }
}
final class ErrorResponseEntity: BaseGeneralResponse {
    /// Mensaje recibido del servicio.
    public var message: String?
    /// Mensajes de error en formularios.
    public var errors: [String: [String]]?
    /// Codificador de la entidad.
    /// - Parameter encoder: Entidad Encoder.
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        try container?.encode(self.message, forKey: .message)
        try container?.encode(self.errors, forKey: .errors)
    }
    /// Inicializador para decodificar.
    /// - Parameter decoder: Entidad Decoder
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.message = try values?.decodeIfPresent(String.self, forKey: .message)
        self.errors = try values?.decodeIfPresent([String: [String]].self, forKey: .errors)
    }
    /// Constructor de la clase
    public init(status: Bool, message: String) {
        super.init()
        self.message = message
        self.status = status
    }
}

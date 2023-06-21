import Foundation

// Représente une matière
public struct Matiere: Identifiable, Equatable, Codable {

    public let id:UUID
    public var name: String
    public var coef: Int
    public var moyenne: Float
    
    // Init
    public init(id: UUID, name: String, coef: Int, moyenne: Float) {
        self.id = id
        self.name = name
        self.coef = coef
        self.moyenne = moyenne
    }
    
    // Init
    public init(name: String, coef: Int, moyenne: Float){
        self.init(id: UUID(), name: name, coef: coef, moyenne: moyenne)
    }
    
    // Equals
    public static func == (lhs: Matiere, rhs: Matiere) -> Bool {
        lhs.id == rhs.id
    }
}

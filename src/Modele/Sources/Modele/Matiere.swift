import Foundation

public struct Matiere: Identifiable, Note {
    
    public let id:UUID
    public var name: String
    public var coef: Int
    public var moyenne: Float
    
    public init(id: UUID, name: String, coef: Int, moyenne: Float) {
        self.id = id
        self.name = name
        self.coef = coef
        self.moyenne = moyenne
    }
    
    public init(name: String, coef: Int, moyenne: Float){
        self.init(id: UUID(), name: name, coef: coef, moyenne: moyenne)
    }
}

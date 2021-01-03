public extension StringProtocol {
    /// Turns the string into a kebab-case string
    /// - returns: String in kebab-case
    func kebabcased() -> String {
        return .init(self
            .flatMap { $0.isWhitespace ? "-" : "\($0)" }
            .enumerated().flatMap { $0 > 0 && $1.isUppercase ? "-\($1.lowercased())" : "\($1.lowercased())" }
        )
    }

    /// Turns the string into a snake_case string
    /// - returns: String in snake_case
    func snakecased() -> String {
        return .init(self
            .flatMap { $0.isWhitespace ? "_" : "\($0)" }
            .enumerated().flatMap { $0 > 0 && $1.isUppercase ? "_\($1.lowercased())" : "\($1.lowercased())" }
        )
    }
}

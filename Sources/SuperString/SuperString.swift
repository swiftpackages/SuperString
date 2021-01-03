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

    /// Turns the string into a camalCase string
    /// - parameters:
    ///     - upper: `Bool` default `false` if true the first character is upper
    /// - returns: String in camelCase
    func camelcased(_ caseType: CamelCaseType = .lower) -> String {
        var output: String = ""
        var previous = false // previous conditon requires next value to be capitalized
        for char in self {
            var capitalize: Bool
            if char.isWhitespace || char.isDash {
                capitalize = true
                previous = true
                continue
            } else if char.isUppercase {
                capitalize = output.isEmpty ? caseType == .upper : true
            } else {
                capitalize = output.isEmpty ? caseType == .upper : false
            }
            output += previous || capitalize ? char.uppercased() : char.lowercased()
            previous = false
        }
        return output
    }
}

public enum CamelCaseType {
    case upper
    case lower
}

public extension Character {
    var isDash: Bool {
        return self == "-"
            || self == "–"
            || self == "—"
            || self == "_"
    }
}

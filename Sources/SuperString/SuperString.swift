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
    ///     - _ caseType: `CamelCaseType` defaults to `.lower`
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

/// Types of camelCase
public enum CamelCaseType {
    // lowerCamelCase: the first character is lowercased
    case upper
    // UpperCamelCase: the first character is uppercased
    case lower
}

public extension Character {
    /// Bool returns if the character is a type of dash (including underscore).
    /// - returns: true if the character is a type of dash (including underscore).
    var isDash: Bool {
        return self == "-"
            || self == "–"
            || self == "—"
            || self == "_"
    }
}

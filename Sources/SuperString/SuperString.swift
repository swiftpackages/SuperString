public extension StringProtocol {
    /// Turns the string into a kebab-case string
    /// - returns: String in kebab-case
    func kebabcased() -> String {
        guard self.count > 0 else {
            return ""
        }

        var output: String = self.first!.lowercased()
        var previous: Character = output.first!

        for char in self.dropFirst() {
            if char.isWhitespace {
                output.append("-")
            } else if char.isUppercase {
                if !previous.isWhitespace {
                    output.append("-")
                }
                output.append(char.lowercased())
            } else {
                output.append(char)
            }
            previous = char
        }

        return output
    }
}

// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import Foundation
import ArgumentParser

import UuidTools



@main
struct kyuuid: ParsableCommand {
    
    static let configuration = CommandConfiguration(
        // Optional abstracts and discussions are used for help output.
        abstract: "A utility for generating & formatting UUIDs.",
        
        discussion: """
        This utility only generates the version of UUIDs that Swift's Foundation library generates. When this utility was originally written (2024-05-30), that's UUIDv4.
        
        \(formatsDiscussion)
        """,
        
        version: "0.3.1",
        
        subcommands: [convert.self])
    
    
    @Option(help: "The output format of the UUID(s) this generates. See FORMATS for more info.", completion: .list(UuidFormat.allValueStrings))
    var format: UuidFormat = .default
    
    @Option(help: "The number of UUIDs to generate at once. Each UUID will be printed on its own line and formatted as specified with the `--format` option.")
    var `repeat`: UInt = 1
    
    @Flag(help: "Causes the generated UUID to be the nil UUID")
    var null = false
    
    
    mutating func run() throws {
        guard 1 < self.repeat || isOutputToTerminal() else {
            print(format.apply(to: null ? .null : UUID()), terminator: "")
            return
        }
        
        for _ in 1 ... max(1, self.repeat) {
            print(format.apply(to: null ? .null : UUID()))
        }
    }
}



private var formatsDiscussion: String {
    """
    FORMATS:
    
    This utility offers \(UuidFormat.allCases.count) different formatting options:
    
    \(UuidFormat.allCases.map { format in
    """
        \(format.rawValue):  \(format.discussion)
            Example: \(format.apply(to: .example))
    
    
    """}.joined())
    """
}



private func isOutputToTerminal() -> Bool {
    return isatty(STDOUT_FILENO) != 0
}

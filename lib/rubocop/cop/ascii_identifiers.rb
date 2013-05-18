# encoding: utf-8

# rubocop:disable SymbolName

module Rubocop
  module Cop
    class AsciiIdentifiers < Cop
      MSG = 'Use only ascii symbols in identifiers.'

      def inspect(file, source, tokens, ast)
        tokens.each do |t|
          if t.type == :tIDENTIFIER && t.text =~ /[^\x00-\x7f]/
            add_offence(:convention, t.pos.lineno, MSG)
          end
        end
      end
    end
  end
end

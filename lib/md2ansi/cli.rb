require 'redcarpet'

module Md2Ansi
  class CLI
    def initialize
        @markdown = Redcarpet::Markdown.new(Ansi, :fenced_code_blocks => true)
    end

    def render(content)
      if content =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
        content = $'
      end

      @markdown.render(content)
    end
  end
end

require 'redcarpet'
require 'ansi'
require 'pygments'

module Md2Ansi
    class Ansi < Redcarpet::Render::Base
      def normal_text(text)
        text.strip
      end

      def block_code(code, language)
        Pygments.highlight(code, :lexer => language, :formatter => 'terminal') + "\n\n"
      end

      def codespan(code)
        Pygments.highlight(code, :formatter => 'terminal')
      end

      def header(title, level)

        case level
        when 1
          ansi(title, :red)
        when 2
          ansi(title, :black, :on_red)
        when 3
          ansi(title, :cyan)
        end + "\n\n"
      end

      def double_emphasis(text)
        " #{ansi(text, :yellow)} "
      end

      def emphasis(text)
        " #{ansi(text, :white, :on_black)} "
      end

      def linebreak
        ""
      end

      def autolink(link, link_type)
        link
      end

      def link(link, title, content)
        " #{content}(#{ansi(link, :underline)}) "
      end

      def image(link, title, alt_text)
        " #{content}(#{ansi(link, :underline)}) "
      end

      def paragraph(text)
        "#{text}\n\n"
      end

      def list(content, list_type)
        case list_type
        when :ordered
          @order = 0
          "#{content}\n"
        when :unordered
          "#{content}\n"
        end
      end

      def list_item(content, list_type)
        case list_type
        when :ordered
          @order =(@order or 0) + 1
          "#{@order}. #{content.strip}\n"
        when :unordered
          "+ #{content.strip}\n"
        end
      end
    end
end

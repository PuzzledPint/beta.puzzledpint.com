# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop can check for array literals made up of word-like
      # strings, that are not using the %w() syntax.
      #
      # Alternatively, it can check for uses of the %w() syntax, in projects
      # which do not want to include that syntax.
      class WordArray < Cop
        include ArraySyntax

        PERCENT_MSG = 'Use `%w` or `%W` for an array of words.'.freeze
        ARRAY_MSG = 'Use `[]` for an array of words.'.freeze
        QUESTION_MARK_SIZE = '?'.size

        def on_array(node)
          if bracketed_array_of?(:str, node)
            check_bracketed(node)
          elsif node.percent_literal?(:string)
            check_percent(node)
          end
        end

        def autocorrect(node)
          if style == :percent
            correct_percent(node)
          else
            correct_bracketed(node)
          end
        end

        private

        def check_bracketed(node)
          return if complex_content?(node.values) ||
                    comments_in_array?(node)
          style_detected(:brackets, node.values.size)

          return unless style == :percent && node.values.size >= min_size

          add_offense(node, :expression, PERCENT_MSG)
        end

        def check_percent(node)
          style_detected(:percent, node.values.size)
          add_offense(node, :expression, ARRAY_MSG) if style == :brackets
        end

        def percent_syntax?(node)
          node.loc.begin && node.loc.begin.source =~ /\A%[wW]/
        end

        def comments_in_array?(node)
          comments = processed_source.comments
          array_range = node.source_range.to_a

          comments.any? do |comment|
            !(comment.loc.expression.to_a & array_range).empty?
          end
        end

        def complex_content?(strings)
          strings.any? do |s|
            string = s.str_content
            !string.valid_encoding? || string !~ word_regex || string =~ / /
          end
        end

        def style
          cop_config['EnforcedStyle'].to_sym
        end

        def min_size
          cop_config['MinSize']
        end

        def word_regex
          cop_config['WordRegex']
        end

        def correct_percent(node)
          words = node.children
          escape = words.any? { |w| needs_escaping?(w.children[0]) }
          char = escape ? 'W' : 'w'
          contents = autocorrect_words(words, escape, node.loc.line)

          lambda do |corrector|
            corrector.replace(node.source_range, "%#{char}(#{contents})")
          end
        end

        def correct_bracketed(node)
          words = node.children.map { |w| to_string_literal(w.children[0]) }

          lambda do |corrector|
            corrector.replace(node.source_range, "[#{words.join(', ')}]")
          end
        end

        def autocorrect_words(word_nodes, escape, base_line_number)
          previous_node_line_number = base_line_number
          word_nodes.map do |node|
            number_of_line_breaks = node.loc.line - previous_node_line_number
            line_breaks = "\n" * number_of_line_breaks
            previous_node_line_number = node.loc.line
            content = node.children.first
            content = escape ? escape_string(content) : content
            content.gsub!(/\)/, '\\)')
            line_breaks + content
          end.join(' ')
        end

        def style_detected(style, ary_size)
          cfg = config_to_allow_offenses
          return if cfg['Enabled'] == false

          largest_brackets = largest_brackets_size(style, ary_size)
          smallest_percent = smallest_percent_size(style, ary_size)

          if cfg['EnforcedStyle'] == style.to_s
            # do nothing
          elsif cfg['EnforcedStyle'].nil?
            cfg['EnforcedStyle'] = style.to_s
          elsif smallest_percent <= largest_brackets
            self.config_to_allow_offenses = { 'Enabled' => false }
          else
            cfg['EnforcedStyle'] = 'percent'
            cfg['MinSize'] = largest_brackets + 1
          end
        end

        def largest_brackets_size(style, ary_size)
          @largest_brackets ||= -Float::INFINITY

          if style == :brackets && ary_size > @largest_brackets
            @largest_brackets = ary_size
          end

          @largest_brackets
        end

        def smallest_percent_size(style, ary_size)
          @smallest_percent ||= Float::INFINITY

          if style == :percent && ary_size < @smallest_percent
            @smallest_percent = ary_size
          end

          @smallest_percent
        end
      end
    end
  end
end

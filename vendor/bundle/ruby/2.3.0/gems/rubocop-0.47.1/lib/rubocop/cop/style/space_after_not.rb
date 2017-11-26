# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for space after `!`.
      #
      # @example
      #   # bad
      #   ! something
      #
      #   # good
      #   !something
      class SpaceAfterNot < Cop
        MSG = 'Do not leave space between `!` and its argument.'.freeze

        def on_send(node)
          return unless node.keyword_bang? && whitespace_after_bang_op?(node)

          add_offense(node, :expression)
        end

        def whitespace_after_bang_op?(node)
          receiver, _method_name, *_args = *node
          receiver.loc.column - node.loc.column > 1
        end

        def autocorrect(node)
          lambda do |corrector|
            receiver, _method_name, *_args = *node
            space_range = range_between(node.loc.selector.end_pos,
                                        receiver.source_range.begin_pos)
            corrector.remove(space_range)
          end
        end
      end
    end
  end
end

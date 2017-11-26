# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # This cop checks for string conversion in string interpolation,
      # which is redundant.
      #
      # @example
      #
      #   # bad
      #
      #   "result is #{something.to_s}"
      #
      # @example
      #
      #   # good
      #
      #   "result is #{something}"
      class StringConversionInInterpolation < Cop
        MSG_DEFAULT = 'Redundant use of `Object#to_s` in interpolation.'.freeze
        MSG_SELF = 'Use `self` instead of `Object#to_s` in ' \
                   'interpolation.'.freeze

        def on_dstr(node)
          node.each_child_node(:begin) do |begin_node|
            final_node = begin_node.children.last
            next unless final_node && final_node.send_type?

            receiver, method_name, *args = *final_node
            next unless method_name == :to_s && args.empty?

            add_offense(
              final_node,
              :selector,
              receiver ? MSG_DEFAULT : MSG_SELF
            )
          end
        end

        private

        def autocorrect(node)
          lambda do |corrector|
            receiver, _method_name, *_args = *node
            corrector.replace(
              node.source_range,
              if receiver
                receiver.source
              else
                'self'
              end
            )
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop checks for redundant uses of `self`.
      #
      # `self` is only needed when:
      #
      # * Sending a message to same object with zero arguments in
      #   presence of a method name clash with an argument or a local
      #   variable.
      #
      #   Note, with using explicit self you can only send messages
      #   with public or protected scope, you cannot send private
      #   messages this way.
      #
      #   Example:
      #
      #   def bar
      #     :baz
      #   end
      #
      #   def foo(bar)
      #     self.bar # resolves name clash with argument
      #   end
      #
      #   def foo2
      #     bar = 1
      #     self.bar # resolves name clash with local variable
      #   end
      #
      # * Calling an attribute writer to prevent an local variable assignment
      #
      #   attr_writer :bar
      #
      #   def foo
      #     self.bar= 1 # Make sure above attr writer is called
      #   end
      #
      # Special cases:
      #
      # We allow uses of `self` with operators because it would be awkward
      # otherwise.
      class RedundantSelf < Cop
        MSG = 'Redundant `self` detected.'.freeze

        def initialize(config = nil, options = nil)
          super
          @allowed_send_nodes = []
          @local_variables_scopes = Hash.new { |hash, key| hash[key] = [] }
        end

        # Assignment of self.x

        def on_or_asgn(node)
          lhs, _rhs = *node
          allow_self(lhs)
        end

        alias on_and_asgn on_or_asgn

        def on_op_asgn(node)
          lhs, _op, _rhs = *node
          allow_self(lhs)
        end

        # Using self.x to distinguish from local variable x

        def on_def(node)
          add_scope(node)
        end

        def on_defs(node)
          add_scope(node)
        end

        def on_args(node)
          node.children.each { |arg| on_argument(arg) }
        end

        def on_blockarg(node)
          on_argument(node)
        end

        def on_lvasgn(node)
          lhs, _rhs = *node
          @local_variables_scopes[node] << lhs
        end

        # Detect offenses

        def on_send(node)
          receiver, method_name, *_args = *node
          return unless receiver && receiver.self_type?
          return unless regular_method_call?(node)

          return if @allowed_send_nodes.include?(node) ||
                    @local_variables_scopes[node].include?(method_name)
          add_offense(node, :expression)
        end

        def autocorrect(node)
          receiver, _method_name, *_args = *node
          lambda do |corrector|
            corrector.remove(receiver.source_range)
            corrector.remove(node.loc.dot)
          end
        end

        private

        def add_scope(node)
          local_variables = []
          node.descendants.each do |child_node|
            @local_variables_scopes[child_node] = local_variables
          end
        end

        def regular_method_call?(node)
          _receiver, method_name, *_args = *node

          !(operator?(method_name) ||
            keyword?(method_name) ||
            constant_name?(method_name) ||
            node.asgn_method_call? ||
            braces_style_call?(node))
        end

        def on_argument(node)
          name, = *node
          @local_variables_scopes[node] << name
        end

        def keyword?(method_name)
          [:alias, :and, :begin, :break, :case, :class, :def, :defined?, :do,
           :else, :elsif, :end, :ensure, :false, :for, :if, :in, :module,
           :next, :nil, :not, :or, :redo, :rescue, :retry, :return, :self,
           :super, :then, :true, :undef, :unless, :until, :when, :while,
           :yield].include?(method_name)
        end

        def constant_name?(method_name)
          method_name.match(/^[A-Z]/)
        end

        def braces_style_call?(node)
          node.loc.selector.nil?
        end

        def allow_self(node)
          return unless node.send_type?

          receiver, _method_name, *_args = *node

          return unless receiver && receiver.self_type?

          @allowed_send_nodes << node
        end
      end
    end
  end
end

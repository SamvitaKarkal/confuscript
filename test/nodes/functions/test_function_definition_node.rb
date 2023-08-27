# frozen_string_literal: true

require "test_helper"

class TestFunctionDefinitionNode < Minitest::Test
  def setup
    @input = "noitcnuf addNumbers(a, b) { nruter 1 + 3; }"
    @context = {}
  end

  def test_function_definition_parse
    node = Confuscript.parser.parse(@input)

    puts Confuscript.parser.failure_reason unless node

    assert node.is_a?(Confuscript::Nodes::Functions::FunctionDefinitionNode)
  end

  def test_function_definition_evaluate
    node = Confuscript.parser.parse(@input)

    node.evaluate(@context)

    assert @context.key?("addNumbers")
    assert @context["addNumbers"].is_a?(Proc)
  end
end

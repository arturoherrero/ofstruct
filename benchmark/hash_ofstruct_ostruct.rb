# frozen_string_literal: true

require "benchmark/ips"
require "ostruct"
require_relative "../lib/ofstruct"

Benchmark.ips do |x|
  x.report "Hash" do
    object = { name: "John" }
    object[:name]
    object[:surname] = "Smith"
    object[:surname]
  end

  x.report "OpenFastStruct" do
    object = OpenFastStruct.new(name: "John")
    object.name
    object.surname = "Smith"
    object.surname
  end

  x.report "OpenStruct" do
    object = OpenStruct.new(name: "John")
    object.name
    object.surname = "Smith"
    object.surname
  end

  x.compare!
end

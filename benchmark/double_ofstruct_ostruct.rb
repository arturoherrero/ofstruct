require "benchmark/ips"
require "ostruct"
require "rspec"
require_relative "../lib/ofstruct"

Benchmark.ips do |x|
  x.report "RSpec Stubs" do
    RSpec.describe "RSpec Stubs" do
      let(:user) { double(:name => "John") }

      it "test" do
        expect(user.name).to eq("John")
      end
    end
  end

  x.report "OpenFastStruct" do
    RSpec.describe "OpenFastStruct" do
      let(:user) { OpenFastStruct.new(:name => "John") }

      it "test" do
        expect(user.name).to eq("John")
      end
    end
  end

  x.report "OpenStruct" do
    RSpec.describe "OpenFastStruct" do
      let(:user) { OpenStruct.new(:name => "John") }

      it "test" do
        expect(user.name).to eq("John")
      end
    end
  end

  x.compare!
end

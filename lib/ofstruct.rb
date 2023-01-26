# frozen_string_literal: true

class OpenFastStruct
  def initialize(args = {})
    @members = {}
    update(args)
  end

  def delete_field(key)
    assign(key, self.class.new)
  end

  def each_pair
    @members.each_pair
  end

  def update(args)
    ensure_hash!(args)
    args.each { |key, value| assign(key, value) }
  end

  def to_h
    @members.merge(@members) do |_, value|
      case value
      when Array
        value.map(&:to_h)
      when self.class
        value.to_h
      else
        value
      end
    end
  end

  def inspect
    "#<#{self.class}#{@members.map { |key, value| " :#{key}=#{value.inspect}" }.join}>"
  end
  alias to_s inspect

  def to_ary
    nil
  end

  def ==(other)
    other.is_a?(self.class) && to_h == other.to_h
  end

  private

  def ensure_hash!(args)
    raise ArgumentError unless args.is_a?(Hash)
  end

  def method_missing(name, *args)
    @members.fetch(name) do
      if name[-1] == "="
        assign(name[0..-2], args.first)
      else
        delete_field(name)
      end
    end
  end

  def assign(key, value)
    @members[key.to_sym] = process(value)
  end

  def process(data)
    case data
    when Hash
      self.class.new(data)
    when Array
      data.map { |element| process(element) }
    else
      data
    end
  end
end

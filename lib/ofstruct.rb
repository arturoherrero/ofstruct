class OpenFastStruct
  def initialize(args = {})
    @members = {}
    assign(args)
  end

  def delete_field(key)
    @members[key.to_sym] = self.class.new
  end

  def each_pair
    @members.each_pair
  end

  def update(args)
    assign(args)
  end

  def to_h
    @members.inject({}) do |result, (k, v)|
      result.tap { |result| result[k] = v.is_a?(self.class) ? v.to_h : v }
    end
  end

  def inspect
    @members.each_with_object("#<#{self.class}") { |(k,v), output| output << " :#{k}=#{v.inspect}" } << ">"
  end
  alias :to_s :inspect

  def to_ary
    nil
  end

  private

  def method_missing(name, *args)
    @members.fetch(name) do
      if name[-1] == "="
        @members[name[0..-2].to_sym] = args.first
      else
        @members[name.to_sym] = self.class.new
      end
    end
  end

  def assign(args)
    ensure_hash(args)
    args.each { |k,v| @members[k.to_sym] = v }
  end

  def ensure_hash(args)
    raise ArgumentError unless args.is_a?(Hash)
  end
end

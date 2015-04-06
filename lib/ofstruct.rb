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
    args.each { |k, v| assign(k, v) }
  end

  def to_h
    @members.merge(@members) { |_, v| v.is_a?(self.class) ? v.to_h : v }
  end

  def inspect
    "#<#{self.class}" + @members.map { |k, v| " :#{k}=#{v.inspect}" }.join + ">"
  end
  alias :to_s :inspect

  def to_ary
    nil
  end

  def ==(other)
    other.is_a?(self.class) && self.to_h == other.to_h
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
    @members[key.to_sym] = value
  end
end

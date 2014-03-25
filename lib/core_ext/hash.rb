class Hash
  def symbolize_keys!
    keys.each do |key|
      self[key.to_sym] = delete(key)
    end
    self
  end

  def serialize
    self.map do |h|
      [h[0],h[1]].join(':')
    end.join('\n')
  end
end

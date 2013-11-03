class Hash
	def symbolize_keys!
		keys.each do |key|
			self[key.to_sym] = delete(key)
		end
		self
	end
end

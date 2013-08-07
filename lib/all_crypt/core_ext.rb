String.class_eval do

	# Example use case: "Plain text".to_sha512(6)  
	# => {"salt"=>"3ylpNHu4", "encrypted"=>"2181af1e422e6d82b00a..2"}

	def to_sha512(digits = 8)
		currentList = Hash.new

		currentList['salt'] = SecureRandom.base64(digits) 
		currentList['encrypted'] = Digest::SHA512.hexdigest("#{Base64.encode64(self)}#{currentList['salt']}")
		return currentList
	end

	def to_sha256(digits = 8)
		currentList = Hash.new

		currentList['salt'] = SecureRandom.base64(digits) 
		currentList['encrypted'] = Digest::SHA256.hexdigest("#{Base64.encode64(self)}#{currentList['salt']}")
		return currentList
	end

	def to_sha1(digits = 8)
		currentList = Hash.new

		currentList['salt'] = SecureRandom.base64(digits)
		currentList['encrypted'] = Digest::SHA1.hexdigest("#{Base64.encode64(self)}#{currentList['salt']}")
		return currentList
	end

	def to_md5(digits = 8)
		currentList = Hash.new

		currentList['salt'] = SecureRandom.base64(digits) 
		currentList['encrypted'] = Digest::MD5.hexdigest("#{Base64.encode64(self)}#{currentList['salt']}")
		return currentList
	end

	# Example use case: "Plain text".encrypt_aes256
	# => {"key"=>"h\xCA\x0..8^", "iv"=>"\x02\xE0j..\xC7", "encrypted"=>"\x1C\x91\r\..xE7"} 

	def encrypt_aes256
		cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
		cipher.encrypt

		currentList = Hash.new
		currentList['key'] = cipher.random_key
		currentList['iv'] = cipher.random_iv
		currentList['encrypted'] = cipher.update(self) + cipher.final
		return currentList
	end

	def decrypt_aes256(key, iv)
		decipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
		decipher.decrypt
		decipher.key = key
		decipher.iv = iv

		currentList = Hash.new
		currentList['decrypted'] = decipher.update(self) + decipher.final
		return currentList
	end

	# Example use: "Plain text".to_base64
	# => "UGxhaW4gdGV4dA==\n" 

	def to_base64
		return Base64.encode64(self)
	end

	def from_base64
		return Base64.decode64(self)
	end

	# Example use: "10".to_random
	# => "2cgUtlTMV9YQuw==" 
	def to_random
		return SecureRandom.base64(self.to_i)
	end
end
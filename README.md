All_crypt Ruby Cryptology Gem
=========

A ruby gem to make web developers job more easy.

<blockquote>
    <p><b>gem install all_crypt</b></p>
</blockquote>

How to use?
=========

This gem uses several encryption and random number generation libraries and adds them to the Ruby's string library with a user friendly function names.

Functions
=========

For all functions: Optional input digits, determines the number of digits of generated salt

to_sha512 => Generates a random salt and uses it in SHA2-512 hashing algorithm. Returns a hash table with a salt and a hash.

to_sha256 => Generates a random salt and uses it in SHA2-256 hashing algorithm. Returns a hash table with a salt and a hash.

to_sha1 => Generates a random salt and uses it in SHA1 hashing algorithm. Returns a hash table with a salt and a hash.

to_md5 => Generates a random salt and uses it in MD5 hashing algorithm. Returns a hash table with a salt and a hash.

encrypt_aes256 => Generates a key and an initialization vector and encrypts the string. Returns a hash table with a key, iv and encrypted text.

decrypt_aes256 => Takes key and IV as an input and decrypts the plain text as an hash.

to_base64 => Encodes the plain text

from_base64 => Decodes the plain text

to_random => Generates a random number.

Example Use
=========

"Plain text".to_sha512(6)
=> {"salt"=>"3ylpNHu4", "encrypted"=>"2181af1e422e6d82b00a..2"}

"Plain text".encrypt_aes256 
=> {"key"=>"h\xCA\x0..8^", "iv"=>"\x02\xE0j..\xC7", "encrypted"=>"\x1C\x91\r\..xE7"} 

"Plain text".to_base64
=> "UGxhaW4gdGV4dA==\n" 

"10".to_random
=> "2cgUtlTMV9YQuw==" 

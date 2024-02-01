def caesar_cipher(string, shift_factor)
  shifted_string = ''
  string.each_char do |char|
    if(char.ord.between?(65, 90) || char.ord.between?(97, 122)) # checks if character is a letter
      base = char.ord < 91 ? 65 : 97 # checks if uppercase or lowercase character
      rotation = (((char.ord - base) + shift_factor) % 26) + base
      shifted_string += rotation.chr
    else
      # symbols or numbers (non-letters) remain unchanged
      shifted_string += char
    end
  end
  shifted_string
end


encrypted_string = caesar_cipher('what A string!', 5)
p encrypted_string
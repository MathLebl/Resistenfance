class MessageCrypter
  def initialize(message)
    @message = message
    @shift = 2
  end

  def encrypt
    alphabet = ("a".."z").to_a
    letters = @message.split("")
    crypted_message = ""
    letters.each do |letter|
      is_letter_upcased = letter == letter.upcase
      letter = letter.downcase
      if alphabet.include?(letter)
        letter_index = alphabet.index(letter)
        crypted_letter = alphabet[(letter_index - @shift) % 26]
        crypted_message += is_letter_upcased ? crypted_letter.upcase : crypted_letter
      else
        crypted_message += letter
      end
    end
    crypted_message
  end

  def decrypt
    @shift = -@shift
    encrypt
  end

end

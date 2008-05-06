class String
  def b64enc
    Base64.encode64(self)
  end

  def b64dec
    Base64.decode64(self)
  end  
end
class PromoCode

  def self.promo_code_message
    pc = @params[:promo_code].chars.to_a

    disc = pc[2].to_i
    sum = (pc[2].to_i + pc[8].to_i + pc[9].to_i).to_s

    achieve! ZeroDiscountPromocode if disc == 0

    if (pc[10] || '').chars.to_a.last != sum
      achieve! InvalidPromoCode
      "Sorry, code <tt>#{@params[:promo_code]}</tt> is not valid"
    else
      achieve! ValidPromoCode
      "Promotional code <tt>#{@params[:promo_code]}</tt> used: <strong>#{disc}0% discount</strong>!"
    end
  end

end
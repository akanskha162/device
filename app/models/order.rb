class Order < ActiveRecord::Base
 belongs_to :cart

  def purchase
    response = EXPRESS_GATEWAY.purchase(11000, express_purchase_options)
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  private

  def express_purchase_options
    {
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
end


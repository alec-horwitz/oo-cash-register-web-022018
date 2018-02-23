class CashRegister
  def initialize(discount = nil)
    @total = 0
    @list = []
    @record = {}
    @discount = discount
  end

  attr_accessor :total, :discount, :list, :record

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    self.record[title] = [price,quantity]
    while quantity>0
      quantity -= 1
      self.list.push(title)
    end
    self.total
  end

  def apply_discount()
    if discount
      self.total = self.total * ((100 - self.discount).to_f / 100)
      "After the discount, the total comes to $"+self.total.to_i.to_s+"."
    else
      "There is no discount to apply."
    end
  end
  def items
    self.list
  end

  def void_last_transaction
    self.total -= (self.record[self.list[-1]][1] * self.record[self.list[-1]][0]) if self.total
  end
end

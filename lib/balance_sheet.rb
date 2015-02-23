require 'date'
class BalanceSheet
	attr_accessor :cash_and_cash_equivalents, :total_current_assets, :total_assets, :short_term_debt, :total_current_liabilites, :long_term_debt, :total_liabilities,
	:total_equity, :period

	def initialize(params)
		@cash_and_cash_equivalents = params["CashAndCashEquivalents"]["content"] if params["CashAndCashEquivalents"]
		@total_current_assets = params["TotalCurrentAssets"]["content"]  if params["TotalCurrentAssets"]
		@total_assets = params["TotalAssets"]["content"]  if params["TotalAssets"]
		@short_term_debt = params["Short_CurrentLongTermDebt"]["content"]  if params["Short_CurrentLongTermDebt"]
		@total_current_liabilites = params["TotalCurrentLiabilities"]["content"]  if params["TotalCurrentLiabilities"]
		@long_term_debt = params["LongTermDebt"]["content"]  if params["LongTermDebt"]
		@total_liabilities = params["TotalLiabilities"]["content"]  if params["TotalLiabilities"]
		@total_equity = params["TotalStockholderEquity"]["content"]  if params["TotalStockholderEquity"]
		@period = Date.parse(params["period"])
	end

	def to_s
		p "#{@period}"
		p "CashAndCashEquivalents: #{@cash_and_cash_equivalents}"
		p "TotalAssets: #{@total_assets}"
	end
end
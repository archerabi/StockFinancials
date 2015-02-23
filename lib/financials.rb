
class Financials
	attr_accessor :statements, :timeframe, :symbol, :type

	def initialize(params,type)
		@type = type
		statements = params["statement"]
		@symbol = params["symbol"]
		@timeframe = params["timeframe"]
		@statements = []
		if type == INCOME_STATEMENT
			statements.each { |statement|
				@statements << IncomeStatement.new(statement)
			}
		elsif type == BALANCE_SHEET
			statements.each { |statement|
				@statements << BalanceSheet.new(statement)
			}
		end
	end
end

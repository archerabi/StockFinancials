require 'yql'
require 'json'

require_relative 'income_statement.rb'

QUARTERLY_TIME_FRAME = 'quarterly'
ANNUAL_TIME_FRAME = 'annual'

class StockFinancials

	def initialize
		@yql = Yql::Client.new
		@yql.format = 'json'
	end

	def income_statement(stock_symbol, period = QUARTERLY_TIME_FRAME)
		query = Yql::QueryBuilder.new 'yahoo.finance.incomestatement'
		query.conditions = "symbol ='#{stock_symbol}' and timeframe='#{period}'"
		@yql.query = query
		response = @yql.get

		unless response && response.show.to_s
			return
		end

		results = JSON.parse(response.show.to_s)
		if !results.has_key?("query") || !results["query"].has_key?("results")
			return
		end

		statements = results["query"]["results"]["incomestatement"]["statement"]
		# income_statement
		# # TODO statements less than 4
		income_statements = []
		statements.each { |statement| 
			income_statements << IncomeStatement.new(statement)
		}
		income_statements
	end
end
require 'yql'
require 'json'

require_relative 'income_statement.rb'
require_relative 'balance_sheet.rb'
require_relative 'financials.rb'

QUARTERLY_TIME_FRAME = 'quarterly'
ANNUAL_TIME_FRAME = 'annual'

BALANCE_SHEET = "BalanceSheet"
INCOME_STATEMENT = "IncomeStatement"

class StockFinancials

	def initialize
		@yql = Yql::Client.new
		@yql.format = 'json'
	end

	def income_statement(stock_symbol, period = QUARTERLY_TIME_FRAME)
		financials = send_query(stock_symbol, period, INCOME_STATEMENT)
	end

	def balance_sheet(stock_symbol, period = QUARTERLY_TIME_FRAME)
		financials = send_query(stock_symbol, period, BALANCE_SHEET)
	end

	private

	def send_query(stock_symbol,period,statement_type)
		query = ""
		if statement_type == INCOME_STATEMENT
			query = Yql::QueryBuilder.new 'yahoo.finance.incomestatement'
		elsif statement_type == BALANCE_SHEET
			query = Yql::QueryBuilder.new 'yahoo.finance.balancesheet'
		end
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
		if statement_type == INCOME_STATEMENT
			financials = Financials.new(results["query"]["results"]["incomestatement"], statement_type)
		elsif statement_type == BALANCE_SHEET
			financials = Financials.new(results["query"]["results"]["balancesheet"], statement_type)
		end
		financials
	end
end
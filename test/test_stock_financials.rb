require 'minitest/autorun'
require 'minitest/pride'
require File.expand_path('../../lib/stock_financials.rb', __FILE__)

describe StockFinancials do

	before do
		@stock_financials = StockFinancials.new
	end

	describe "fetch income statement" do
		it "must fetch quarterly" do
			financials = @stock_financials.income_statement("AAPL")
			financials.wont_be_nil
			assert_equal(financials.symbol,"AAPL")
			assert_equal(financials.timeframe,QUARTERLY_TIME_FRAME)
			assert_equal(financials.type, INCOME_STATEMENT)
		end
		it "must fetch annual" do
			financials = @stock_financials.income_statement("CSIQ", ANNUAL_TIME_FRAME)
			financials.wont_be_nil
			assert_equal(financials.symbol,"CSIQ")
			assert_equal(financials.timeframe,ANNUAL_TIME_FRAME)
			assert_equal(financials.type,INCOME_STATEMENT)
		end
	end

	describe "fetch balance sheet" do
		it "must fetch" do
			financials = @stock_financials.balance_sheet("AAPL")
			assert_equal(financials.symbol,"AAPL")
			assert_equal(financials.timeframe,QUARTERLY_TIME_FRAME)
			assert_equal(financials.type, BALANCE_SHEET)
		end
	end

end

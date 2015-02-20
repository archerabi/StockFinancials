require 'minitest/autorun'
require 'minitest/pride'
require File.expand_path('../../lib/stock_financials.rb', __FILE__)

describe StockFinancials do

	before do
		@stock_financials = StockFinancials.new
	end

	describe "fetch income statement" do
		it "must fetch" do
			stmts = @stock_financials.income_statement("AAPL")
			stmts.wont_be_nil
			stmts[0].to_s
		end
	end

end

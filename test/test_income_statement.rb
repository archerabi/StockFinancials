require 'minitest/autorun'
require 'minitest/pride'
require File.expand_path('../../lib/income_statement.rb', __FILE__)

describe IncomeStatement do

	describe "income statement" do
		it "initialize" do
			stmt = IncomeStatement.new({ 
				"TotalRevenue" => {"content" => 34599345},
				"CostofRevenue" => {"content" => 83458},
				"TotalOperatingExpenses" => {"content" => 23496943},
				"IncomeBeforeTax" => {"content" => 152355},
				"NetIncome" => {"content" => 9679459},
				"GrossProfit" => {"content" => 23423},
				"OperatingIncomeOrLoss" => {"content" => 7567}
				})
			assert_equal(34599345,stmt.total_revenue)
			assert_equal(stmt.cost_of_revenue, 83458)
			assert_equal(stmt.income_before_tax, 152355)
			assert_equal(stmt.net_income, 9679459)
			assert_equal(stmt.gross_profit, 23423)
		end
	end

end

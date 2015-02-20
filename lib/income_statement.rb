class IncomeStatement
	attr_accessor :total_revenue,:cost_of_revenue,:gross_profit,
		:total_operating_expenses,:operating_income_or_loss,:ebit,
		:interest_expenses,:income_before_tax,:income_tax_expense,:net_income
	def initialize(params)
		@total_revenue = params["TotalRevenue"]["content"] if params["TotalRevenue"]
		@cost_of_revenue = params["CostofRevenue"]["content"]  if params["CostofRevenue"]
		@gross_profit = params["GrossProfit"]["content"]  if params["GrossProfit"]
		@total_operating_expenses = params["TotalOperatingExpenses"]["content"]  if params["TotalOperatingExpenses"]
		@operating_income_or_loss = params["OperatingIncomeOrLoss"]["content"]  if params["OperatingIncomeOrLoss"]
		@ebit = params["EarningsBeforeInterestAndTaxes"]["content"]  if params["EarningsBeforeInterestAndTaxes"]
		@interest_expenses = params["InterestExpense"]["content"]  if params["InterestExpense"]
		@income_before_tax = params["IncomeBeforeTax"]["content"]  if params["IncomeBeforeTax"]
		@income_tax_expense = params["IncomeTaxExpense"]["content"]  if params["IncomeTaxExpense"]
		@net_income = params["NetIncome"]["content"]  if params["NetIncome"]
	end

	def to_s
		p "Total Revenue: #{@total_revenue}"
		p "Cost of Revenue: #{@cost_of_revenue}"
		p "Gross Profit: #{@gross_profit}"
	end
end

Get financial statements for stocks listed on NYSE/NASDAQ

## Usage

#### Quarterly Statements
###### Income Statements
```ruby
StockFinancials.new.income_statement("AAPL")
```

###### Balance Sheets

```ruby
StockFinancials.new.balance_sheet("AAPL")
```

#### Annual 
###### Income Statements
```ruby
StockFinancials.new.income_statement("AAPL",ANNUAL_TIME_FRAME)
```
# frozen_string_literal: true

Given(/^I (?:add|ask|create|filter|have|request) .+? "(.+?)"$/) do |code|
  @result = eval "@#{code}"
end


Then(/^Mortadella returns/) do |table|
  table.diff! @result
end


Then(/^it responds with (.+?)$/) do |code|
  @result = eval "@#{code}"
end


Then(/^I have these ingredients$/) do |table|
  t = Mortadella::Horizontal.new headers: %w(INGREDIENT AMOUNT)
  t << ['flour', '12 oz']
  t << ['butter', '2 oz']
  t << ['apples', '5 pc']
  t << ['cinnamon', '1 tsp']
  table.diff! t.table
end

prices = [0.0,0.0,0,0,0]
subTotal = 0.0
tax = 0.0
total = 0.0

for x in range (5):
    prices[x] = float(input("Enter the price for the item " + str(x+1)+". "))
    subTotal += prices[x]

tax = subTotal * 0.07
total = subTotal + tax

print('\n{:<10}'.format('Item'),'{:<14}'.format('Price'))
for x in range (5):
    
    print('{:<10}'.format(x+1),'${:>14,.2f}'.format(prices[x]))

print('\n{:<10}'.format('Subtotal:'),'${:>8,.2f}'.format(subTotal))
print('{:<10}'.format('Tax:'),'${:>8,.2f}'.format(tax))
print('\n{:<10}'.format('Total:'),'${:>8,.2f}'.format(total))
amt = int(input('How many packages were ordered? '))

subtotal = 0.0
discount = 0.0
total = 0.0

if amt > 0:

    subtotal = 99 * amt
    if amt < 10:
        discount = 0
    elif amt < 20:
        discount = subtotal * 0.1
    elif amt < 50:
        discount = subtotal * 0.2
    elif amt < 100:
        discount = subtotal * 0.3
    else:
        discount = subtotal * 0.4

    total = subtotal - discount

    print('Subtotal: $'+format(subtotal, '11,.2f'))
    print('Discount: $'+format(discount, '11,.2f'))
    print('Total:    $'+format(total, '11,.2f'))

else:
    print('You need to order at least one package to get a recipt.')
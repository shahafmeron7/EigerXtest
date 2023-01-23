
# in the explanation you said that the type of productprices array is string: "string productPrices[n]:"
# but in the example of the question you passed an float array : "productPrices = [2.89, 3.29, 5.79]"
# if you insist that I will address it as string I will just use a conversion from string to float or the opposite.

def priceCheck(products, productPrices, productSold, soldPrice):

    # building dictionary so each item has it price.
    products_prices = dict(zip(products, productPrices))
    # building dictionary so each sold item has it price.
    products_sold = dict(zip(productSold, soldPrice))
    errors = 0
    for item in products_sold.items():
        # checking if the price of the sold item is different from the actual price of the item.
        # item is a tuple contains the key(product name) and value (product price) from the sold products.
        if item[1] != products_prices[item[0]]:
            errors += 1

    return errors


print(priceCheck(
    products=['eggs', 'milk', 'cheese'],
    productPrices=[2.89, 3.29, 5.79],
    productSold=['eggs', 'eggs', 'cheese', 'milk'],
    soldPrice=[2.89, 2.99, 5.97, 3.29],))


print(priceCheck(
    products=['rice', 'sugar', 'wheat', 'cheese'],
    productPrices=[16.89, 56.92, 20.89, 345.99],
    productSold=['rice', 'cheese'],
    soldPrice=[18.99, 400.89]
))

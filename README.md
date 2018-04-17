# Bloom & Wild Test

Hello! And welcome to the Bloom & Wild coding exercise.

We recommend you spend around 2-3 hours over this exercise, but how much time
you take is up to you. Read through the brief below for details of what to do
and what we're looking for.

When you've finished please email steve@bloomandwild.com. If you have any questions, just drop us an email.

## Test brief

In this test you'll be building a simple app to enable placement of an order
for a bouquet.

We'll be looking for things like:
* A clean and simple solution
* Done in a standard way
* Solid use of tests

## Getting started

We've provided you with a skeleton rails application -- once it's running, you
can visit http://localhost:3000 and use the simple UI to place an order.

You should build on top of this solution for the tasks below.

## Tasks

* Add a feature test (there's an example already) which places an order.
* Expand on (or delete) the model tests in `spec/models`
* Add the ability to upgrade shipping (£2.50 per order) to "Special Delivery"
* Create a new model called "Delivery" containing:

  - Bouquet
  - Recipient name
  - Delivery date
  - Reference to the order that created it
  - The shipping method to be used

  Do not connect it to anything else yet!

* Add a rake task called "shipping". When this task runs it should take a date
  as an argument and create a Delivery object for all Order objects going out
  that day that have status "billed". It should set the status of Order to
  "complete" when it is done.
* Add a new attribute to Order "three_month_bundle" that, if true, will have
  a delivery every month from the Order's delivery_on date for 3 months (Price
  increase is `Bouquet.price * 3` but with a 10% discount on bouquet 2 and 3)
* Update the Shipping task to make sure it produces deliveries for these
  bundles, orders should remain in "billed" until all three deliveries have
  been created.
* Discussion: How might you improve the architecture of the code? Specifically
  think about what might happen if the application were to die mid way through
  processing an order and what will happen as complexity increases

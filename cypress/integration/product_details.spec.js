describe('Product Details page', () => {
  beforeEach(() => {
    //do stuff before each test
    console.log('new test')
  })

  it('should visit home page', () => {
    cy.visit('/');
  })

  it('should add a product to cart', () => {
    cy.get('.products').children().first().click()
  })
})
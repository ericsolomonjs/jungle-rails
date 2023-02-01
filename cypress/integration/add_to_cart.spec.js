describe('Add to cart', () => {
  beforeEach(() => {
    //do stuff before each test
    console.log('new test')
  })

  it('should visit home page', () => {
    cy.visit('/');
  })

  it('should add a product to cart', () => {
    cy.get('.products').get('.btn').click();
    cy.get('.end-0 > .nav-link').should('contain', "My Cart (1)")
  })
})

describe('Home Page', () => {
  beforeEach(() => {
    //do stuff before each test
    console.log('new test')
  })

  it('should visit home page', () => {
    cy.visit('/');
  })

  it('should visit a product detail page', () => {
    cy.get('.products').children().first().click()
  })
})
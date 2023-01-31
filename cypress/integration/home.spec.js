describe( 'Home Page', () =>  {
  beforeEach( () =>  {
    //do stuff before each test
    console.log('new test')
  })

  it('should visit home page', () => {
    cy.visit('/');
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  
})
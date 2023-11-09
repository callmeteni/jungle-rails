describe('Home Page', () => {
    it('should visit the home page', () => {
      cy.visit('/');
      cy.url().should('include', '/');
      cy.contains('Welcome to The Jungle');
      
    });

    it("There is products on the page", () => {
        cy.get(".products article").should("be.visible");
      });

    it("There is 2 products on the page", () => {
        cy.get(".products article").should("have.length", 2);
      });
  });
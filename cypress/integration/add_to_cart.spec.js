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

  describe('Add to Cart', () => {
    it('should update the cart count when adding products', () => {
      cy.visit('/');
        cy.get('article button').first().click();
        cy.get('#cart-count').should('have.text', '1');
    });
  });
  
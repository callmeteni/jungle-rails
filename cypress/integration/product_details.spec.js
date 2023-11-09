describe('Product Details', () => {
    it('displays product details and adds to cart', () => {
      cy.visit('/products/1');
  
      cy.get('article').should('exist');
    
      // Check if the cart has been updated
      cy.get('.cart-count').should('contain', '1'); // Assuming you have a cart count element
  
    });
  });
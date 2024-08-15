import { faker } from '@faker-js/faker';

const apiKey = Cypress.env('TRELLO_API_KEY');
const token = Cypress.env('TRELLO_TOKEN');
const cardName = faker.company.catchPhraseAdjective();


describe('Trello e2e', () => {

  before(() => {

    cy.readFile('cypress/fixtures/listBoardId.json').then((data) => {

      const listBoardId = data.listBoardId;

      cy.request({
        method: 'POST',
        url: 'https://api.trello.com/1/cards',
        qs: {
          idList: listBoardId,
          name: cardName,
          key: apiKey,
          token: token
        }
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.have.property('id').and.be.a('string')

        const cardId = response.body.id;
        cy.writeFile('cypress/fixtures/cardId.json', { cardId });

      });

    });

});


  it('Delete card by ID', () => {
    cy.readFile('cypress/fixtures/cardId.json').then((data) => {

      const cardId = data.cardId;

    cy.request({
      method: 'DELETE',
      url: `https://api.trello.com/1/cards/${cardId}`,
      qs: {
        key: apiKey,
        token: token
      }
    }).then((response) => {
      expect(response.status).to.eq(200);

    });
  });
});

  

});
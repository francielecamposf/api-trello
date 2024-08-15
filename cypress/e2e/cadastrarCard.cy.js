import { faker } from '@faker-js/faker';

const apiKey = Cypress.env('TRELLO_API_KEY');
const token = Cypress.env('TRELLO_TOKEN');
const listName = faker.company.buzzVerb();
const cardName = faker.company.catchPhraseAdjective();

describe('Trello e2e', () => {

  before(() => {

    cy.readFile('cypress/fixtures/boardId.json').then((data) => {

      const boardId = data.boardId;

      const url = `https://api.trello.com/1/boards/${boardId}/lists`;

      cy.request({
        failOnStatusCode: false,
        method: 'POST',
        url: url,
        qs: {
          name: listName,
          key: apiKey,
          token: token
        }
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.have.property('id').and.be.a('string')

        const listBoardId = response.body.id
        cy.writeFile('cypress/fixtures/listBoardId.json', { listBoardId });

      });
    });

  });

  it('Create a new Card', () => {

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
});
import { faker } from '@faker-js/faker';

const apiKey = Cypress.env('TRELLO_API_KEY');
const token = Cypress.env('TRELLO_TOKEN');
const boardName = faker.company.buzzNoun();
const listName = faker.company.buzzVerb();
const cardName = faker.company.catchPhraseAdjective();

describe('Trello e2e', () => {

  before(() => {

    cy.request({
      method: 'POST',
      url: 'https://api.trello.com/1/boards/',
      qs: {
        name: boardName,
        key: apiKey,
        token: token
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
      expect(response.body).to.have.property('id').and.be.a('string')

      const boardId = response.body.id;
      cy.writeFile('cypress/fixtures/boardId.json', { boardId });

    });
  });

  it('Delete the board by ID', () => {

    cy.readFile('cypress/fixtures/boardId.json').then((data) => {

      const boardId = data.boardId;

      cy.request({
        method: 'DELETE',
        url: `https://api.trello.com/1/boards/${boardId}`,
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
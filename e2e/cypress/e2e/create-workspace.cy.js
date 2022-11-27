describe('create workspace', () => {
  it('successful', () => {
    const id = `cypress-${Date.now()}`
    cy.visit('http://localhost:3000/organizations/new')
    cy.getByLabel("ID").type(id)
    cy.getByLabel("Name").type(id)
    cy.get("button[type=submit]").click()
    cy.contains(id)
  })
})

describe('create workspace', () => {
  it('successful', () => {
    const id = `cypress_${Date.now()}`
    cy.visit('http://lvh.me:3000/workspaces/new')
    cy.getByLabel("ID").type(id)
    cy.getByLabel("Name").type(id)
    cy.get("button[type=submit]").click()
    cy.contains(id)
  })
})

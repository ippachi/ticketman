db = db.getSiblingDB("ticketmanTestDB");
db.createUser({ user: "ticketman", pwd: "password", roles: [{ role: "readWrite", db: "ticketmanTestDB" }] })
db.createCollection("workspaces", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      properties: {
        id: {
          bsonType: "string"
        },
        name: {
          bsonType: "string"
        }
      },
      required: ["id", "name"]
    }
  }
})
db.workspaces.createIndex({ id: 1 })

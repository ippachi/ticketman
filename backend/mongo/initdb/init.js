db = db.getSiblingDB("ticketmanDB");
db.createUser({ user: "ticketman", pwd: "password", roles: [{ role: "readWrite", db: "ticketmanDB" }] });

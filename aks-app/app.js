const cosmos = require('@azure/cosmos');
const endpoint = process.env.COSMOS_DB_ENDPOINT;
const key = process.env.COSMOS_DB_KEY;
const databaseId = 'iot-demo-sqldb';
const containerId = 'iot-demo-container';

const { CosmosClient } = cosmos;
const client = new CosmosClient({ endpoint, key });

async function main() {
    const { database } = await client.databases.createIfNotExists({ id: databaseId });
    const { container } = await database.containers.createIfNotExists({ id: containerId });

    const querySpec = {
        query: 'SELECT * FROM c'
    };

    const { resources: items } = await container.items.query(querySpec).fetchAll();

    console.log('Items found:');
    items.forEach(item => {
        console.log(item);
    });
}

main().catch(err => {
    console.error(err);
});

const fields = [
    ["customer", "customer_id (PK)", "(varchar(36))"],
    ["customer", "first_name", "(varchar(40))"],
    ["customer", "last_name", "(varchar(50))"],
    ["customer", "email", "(varchar(256))"],
    ["product", "product_id (PK)", "(varchar(36))"],
    ["product", "product_image_url", "(varchar?(2048))"],
    ["product", "name", "(varchar(40))"],
    ["product", "description", "(varchar?(2048))"],
    ["product", "author_id", "(varchar?(36))"],
    ["product", "price_per_unit", "(decimal)"],
    ["store", "store_id (PK)", "(varchar(36))"],
    ["store", "name", "(varchar(40))"],
    ["store", "state_code", "(varchar(3))"],
    ["store", "city", "(varchar(20))"],
    ["store", "street_address", "(varchar(50))"],
    ["store", "zip_code", "(int4)"],
    ["store_inventory", "store_inventory_id (PK)", "(varchar(36))"],
    ["store_inventory", "store_id (FK)", "(varchar(36))"],
    ["store_inventory", "product_id (FK)", "(varchar(36))"],
    ["store_inventory", "quantity", "(int4)"],
    ["store_inventory", "restock_threshold", "(int4)"],
    ["address", "address_id (PK)", "(varchar(36))"],
    ["address", "customer_id (FK)", "(varchar(36))"],
    ["address", "country_code", "(varchar(3))"],
    ["address", "state_code", "(varchar(3))"],
    ["address", "city", "(varchar(60))"],
    ["address", "street_address", "(varchar(80))"],
    ["address", "zip_code", "(varchar(20))"],
    ["address", "default", "(boolean)"],
    ["order", "order_id (PK)", "(varchar(36))"],
    ["order", "promotion_id (FK)", "(varchar?(36))"],
    ["order", "store_id (FK)", "(varchar(36))"],
    ["order", "customer_id (FK)", "(varchar(36))"],
    ["order", "delivery_address", "(varchar?(36))"],
    ["order", "in_store_pickup", "(boolean)"],
    ["order", "status", "(int4)"],
    ["order", "processed_timestamp", "(timestamp with timezone)"],
    ["order_status", "order_status_id (PK)", "(int4)"],
    ["order_status", "name", "(varchar(20))"],
    ["order_status", "description", "(varchar(256))"],
    ["order_line_item", "order_line_item_id (PK)", "(varchar(36))"],
    ["order_line_item", "order_id (FK)", "(varchar(36))"],
    ["order_line_item", "product_id (FK)", "(varchar(36))"],
    ["order_line_item", "quantity", "(int4)"],
    ["event", "event_id (PK)", "(varchar(36))"],
    ["event", "store_id (FK)", "(varchar(36))"],
    ["event", "pomotion_id", "(varchar?(36))"],
    ["event", "name", "(varchar(40))"],
    ["event", "image_url", "(varchar?(2048))"],
    ["event", "image_2_url", "(varchar?(2048))"],
    ["event", "description", "(varchar(2048))"],
    ["event", "start_timestamp", "(timestamp with timezone)"],
    ["event", "end_timestamp", "(timestamp with timezone)"],
    ["event_featured_product", "event_featured_product_id (PK)", "(varchar(36))"],
    ["event_featured_product", "event_id (FK)", "(varchar(36))"],
    ["event_featured_product", "product_id (FK)", "(varchar(36))"],
    ["product_category", "product_category_id (PK)", "(int4)"],
    ["product_category", "parent_id (FK)", "(int4?)"],
    ["product_category", "name", "(varchar(40))"],
    ["product_category", "description", "(varchar(256))"],
    ["author", "author_id (PK)", "(varchar(36))"],
    ["author", "author_image_url", "(varchar?(2048))"],
    ["author", "first_name", "(varchar(40))"],
    ["author", "last_name", "(varchar?(50))"],
    ["author", "biography", "(varchar(2048))"],
    ["deliverable_regions", "deliverable_region_id (PK)", "(int4)"],
    ["deliverable_regions", "country_code", "(varchar(3))"],
    ["deliverable_regions", "state_code", "(varchar(3))"],
    ["product_category_map", "product_category_map_id (PK)", "(int4)"],
    ["product_category_map", "product_id (FK)", "(varchar(36))"],
    ["product_category_map", "product_category_id (FK)", "(int4)"],
    ["promotion", "promotion_id (PK)", "(varchar(36))"],
    ["promotion", "name", "(varchar(40))"],
    ["promotion", "description", "(varchar(80))"],
    ["promotion", "discount_percentage", "(varchar?(36))"],
    ["promotion", "start_timestamp", "(timestamp with timezone)"],
    ["promotion", "end_timestamp", "(timestamp with timezone)"],
    ["product_promotion", "product_promotion_id (PK)", "(varchar(36))"],
    ["product_promotion", "promotion_id (FK)", "(varchar(40))"],
    ["product_promotion", "product_id (FK)", "(varchar(80))",]
];

const processType = (value) => {
    let output = value;
    let nullable = false;
    if (value[0] === "(") {
        output = value.slice(1, -1);
    }

    if (value.includes("?")) {
        output = output.replace("?", "");
        nullable = true;
    }

    switch (output) {
        case "int4":
            output = "int";
            break;
        case "timestamp with timezone":
            output = "datetimeoffset";
            break;
        case "boolean":
            output = "bit";
            break;
    }

    return nullable
        ? `${output} NULL`
        : `${output} NOT NULL`;
}


let tableDefinitions = [];
let operatingObj = null;
let currentTable = null;
for (let i = 0; i < fields.length; i++) {
    let [tableName, attributes, type] = fields[i];
    type = processType(type);

    if (currentTable !== tableName) {
        if (operatingObj != null) {
            operatingObj.fields.push({
                name: "create_username",
                type: "varchar(256) NOT NULL",
                isPrimary: false
            });   
            operatingObj.fields.push({
                name: "create_timestamp",
                type: "datetimeoffset NOT NULL",
                isPrimary: false
            });   
            operatingObj.fields.push({
                name: "modify_username",
                type: "varchar(256) NOT NULL",
                isPrimary: false
            });   
            operatingObj.fields.push({
                name: "modify_timestamp",
                type: "datetimeoffset NOT NULL",
                isPrimary: false
            });   
            
            tableDefinitions.push(operatingObj);
        }
        
        currentTable = tableName;
        operatingObj = {
            database: "heartland_escapes",
            schema: "dbo",
            tableName,
            fields: []
        }
    }

    let isPrimary = false;
    let isForeign = false;
    if (attributes.includes("(PK)")) {
        attributes = attributes.replace(" (PK)", "");
        isPrimary = true;
    } else if (attributes.includes("(FK)")) {
        attributes = attributes.replace(" (FK)", "");
        isForeign = true;
    }

    operatingObj.fields.push({
        name: attributes,
        type,
        isPrimary,
        isForeign
    });
}

console.log(tableDefinitions);

const generateTableScript = (obj) => {
    let tableScript = `CREATE TABLE ${obj.database}.${obj.schema}.${obj.tableName} (\n`;
    for (let i = 0; i < obj.fields.length; i++) {
        const field = obj.fields[i];
        tableScript += field.isPrimary
            ? `\t${field.name} ${field.type} PRIMARY KEY`
            : `\t${field.name} ${field.type}`;

        tableScript += i === obj.fields.length - 1
            ? "\n"
            : ",\n";
    }
    tableScript += ");";
    return tableScript;
}

const generateFKConstraintScripts = (obj) => {
    const alterScripts = [];
    
    const fields = obj.fields.filter(field => field.isForeign);
    for (let i = 0; i < fields.length; i++) {
        const field = fields[i];
        
        let alterScript = `ALTER TABLE ${obj.database}.${obj.schema}.${obj.tableName}\n`;
        alterScript += `\tADD CONSTRAINT FK_${field.name}\n`;
        alterScript += `\tFOREIGN KEY (${field.name}) REFERENCES ${field.name.replace("_id", "")}(${field.name});`
        alterScripts.push(alterScript);
    }

    return alterScripts;
}

let tableScripts = [];
let fkConstraintScripts = [];
for(let i = 0; i < tableDefinitions.length; i++) {
    tableScripts.push(generateTableScript(tableDefinitions[i]));
    fkConstraintScripts = fkConstraintScripts.concat(generateFKConstraintScripts(tableDefinitions[i]));
}

const allScripts = [...tableScripts, ...fkConstraintScripts].join("\n\n");
console.log(allScripts);
const pool = require("./../config/database")

const getWizards = async () => {
    const result = await pool.query("SELECT wizards.*, houses.name AS house_name FROM wizards LEFT JOIN houses ON wizards.house_id = houses.id");
    return result.rows
};

const getWizardById = async (id) => {
    const result = await pool.query(
        `SELECT wizards.*, houses.name AS house_name 
        FROM wizards 
        LEFT JOIN houses ON wizards.house_id = houses.id 
        WHERE wizards.id = $1`, [id]
    );
    return result.rows[0];
};

const createWizard = async (name, house_id, image) => {
    const result = await pool.query(
        "INSERT INTO wizards (name, house_id, image) VALUES ($1, $2, $3) RETURNING *", [name, house_id, image]);
    return result.rows[0];
};
const  deleteWizard = async (id) => {
    const result = await pool.query(
        "DELETE FROM wizards WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Bruxo não encontrado." };
    }
    return { message: "Bruxo deletado com sucesso." };
}
const updateWizard = async (id, data) => {
    const { name, house_id } = data;
    const result = await pool.query(
        "UPDATE wizards SET name = $1, house_id = $2, image = $3 WHERE id = $4 RETURNING *",
        [name, house_id, id]
    );
    return result.rows[0];
}

module.exports = { getWizards, getWizardById, createWizard, deleteWizard, updateWizard };
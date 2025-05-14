import { getConnection } from "../config/Connection.js";

const getAllFormularios = async ()=>{

    const con = await getConnection
    const result = await con.request().query('select*from datos_empleado_cliente')
    return result.recordset
    
    
}


//Aqui

const createFormulario = async ({ id_pregunta_fk, id_usuario_fk }) => {
  const pool = await getConnection;
  const result = await pool.request()
    .input("id_pregunta_fk", sql.BigInt, id_pregunta_fk)
    .input("id_usuario_fk", sql.BigInt, id_usuario_fk)
    .query(`
      INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk)
      VALUES ((SELECT ISNULL(MAX(id_formulario),0)+1 FROM formularios), @id_pregunta_fk, @id_usuario_fk);
    `);

  return result.rowsAffected[0];  // 1 si se insertó bien
};

export { getAllFormularios, createFormulario };
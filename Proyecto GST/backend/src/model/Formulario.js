import { getConnection } from "../config/Connection.js";

const getAllFormularios = async ()=>{

    const con = await getConnection
    const result = await con.request().query('select*from datos_empleado_cliente')
    return result.recordset
    
    
}

export {getAllFormularios}
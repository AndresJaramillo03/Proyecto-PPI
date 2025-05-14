import { getConnection } from "../config/Connection.js";
import sql from 'mssql';

const getAllFormularios = async ()=>{

    const con = await getConnection
    const result = await con.request().query('select*from datos_empleado_cliente')
    return result.recordset
    
    
}


//Aqui

const createFormularioCompleto = async (data) => {
  const {
    id_usuario_fk, r1, r2, r3, r4, r5,
    r6, r7, r8, r9, r10
  } = data;

const pool = await getConnection;

  // 1. Insertar en preguntas
  const resultPreguntas = await pool.request()
    .input("r1", sql.NVarChar, r1)
    .input("r2", sql.NVarChar, r2)
    .input("r3", sql.NVarChar, r3)
    .input("r4", sql.NVarChar, r4)
    .input("r5", sql.NVarChar, r5)
    .input("r6", sql.NVarChar, r6)
    .input("r7", sql.NVarChar, r7)
    .input("r8", sql.NVarChar, r8)
    .input("r9", sql.NVarChar, r9)
    .input("r10", sql.NVarChar, r10)
    .query(`
      INSERT INTO preguntas (
        id_pregunta,
        Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
        Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
        Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
        Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
        Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
        Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
        Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
        Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
        Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
        Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
      ) VALUES (
        (SELECT ISNULL(MAX(id_pregunta), 0) + 1 FROM preguntas),
        @r1, @r2, @r3, @r4, @r5, @r6, @r7, @r8, @r9, @r10
      )
    `);

  if (resultPreguntas.rowsAffected[0] !== 1) return false;

  // 2. Obtener el id_pregunta recién insertado
  const id_pregunta_fk = (await pool.request().query(`SELECT MAX(id_pregunta) as id FROM preguntas`)).recordset[0].id;

  // 3. Insertar en formularios
  const resultFormulario = await pool.request()
    .input("id_pregunta_fk", sql.BigInt, id_pregunta_fk)
    .input("id_usuario_fk", sql.BigInt, id_usuario_fk)
    .query(`
      INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk)
      VALUES ((SELECT ISNULL(MAX(id_formulario), 0) + 1 FROM formularios), @id_pregunta_fk, @id_usuario_fk)
    `);

  return resultFormulario.rowsAffected[0] === 1;
};

export { getAllFormularios, createFormularioCompleto };
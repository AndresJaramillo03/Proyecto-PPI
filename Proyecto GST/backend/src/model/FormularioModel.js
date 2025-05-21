import { getConnection, sql } from '../config/Connection.js';

const getAllFormularios = async ()=>{

    const con = await getConnection
    const result = await con.request().query('select*from preguntas')
    return result.recordset
    
    
}

const insertFormularios = async (formulario) => {

    const {/*id_pregunta,*/
    Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
    Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
    Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
    Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
    Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
    Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
    Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
    Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
    Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
    Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral} = formulario

    const con = await getConnection
    await con .request()
    /*.input('id_pregunta', sql.BigInt, id_pregunta )*/
    .input('Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar', sql.NVarChar, Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar)
    .input('Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral', sql.NVarChar, Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral)
    .input('Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar', sql.NVarChar, Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar)
    .input('Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales', sql.NVarChar, Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales)
    .input('Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo', sql.NVarChar, Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo)
    .input('Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses', sql.NVarChar, Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses)
    .input('Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres', sql.NVarChar, Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres)
    .input('Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo', sql.NVarChar, Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo)
    .input('Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal', sql.NVarChar, Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal)
    .input('Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral', sql.NVarChar, Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral)
    .execute('sp_InsertarPregunta3')
}

const deleteFormulario = async ({ id_pregunta }) => {
    const con = await getConnection;
    await con.request()
        .input('id_pregunta', sql.BigInt, id_pregunta)
        .execute('sp_eliminar_formulario_v2');
};

const actualizarFormularioPorId = async (id, datos) => {
  const pool = await getConnection;
  const request = pool.request();
  
  request.input('id_pregunta', sql.BigInt, id);

  for (const [key, value] of Object.entries(datos)) {
    request.input(key, sql.NVarChar(500), value);
  }

  await request.query(`
    UPDATE preguntas SET 
      Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar = @Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
      Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral = @Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
      Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar = @Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
      Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales = @Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
      Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo = @Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
      Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses = @Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
      Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres = @Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
      Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo = @Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
      Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal = @Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
      Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral = @Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
    WHERE id_pregunta = @id_pregunta
  `);
};

export {getAllFormularios, insertFormularios, deleteFormulario, actualizarFormularioPorId};
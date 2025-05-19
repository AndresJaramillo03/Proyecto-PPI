import React, { useState, useEffect } from "react";
import { ObtenerFormulario } from "../services/FormsService";
import fondoHome from "../assets/fondo-home.png";
import Swal from 'sweetalert2';
import axios from "axios";

export default function SeeFrom() {

  const [formulario, setFormulario] = useState ([])
  const [error, setError] = useState ('')

  useEffect((f) => {
    fetchFormularios()
  },[])

  const fetchFormularios = async() =>{
   try {
      const form = await ObtenerFormulario()
      setFormulario(form)
   } catch (error) {
      setError(error)
   }
  }

  const hanldeEliminar = (idPregunta) => {
  
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, delete it!"
    }).then((result) => {
      if (result.isConfirmed) {
          axios.delete(`http://localhost:3000/${idPregunta}`)
        Swal.fire({
          title: "Deleted!",
          text: "Your file has been deleted.",
          icon: "success"
        });
      }
      fetchFormularios();
    });

  }


  return (
    <div className="container">
     <h1 className="text-center my-4">LISTA DE FORMULARIOS</h1>

<div className="table-responsive rounded overflow-hidden shadow">
  <table className="table table-bordered table-striped table-hover align-middle">
    <thead className="table-dark text-center">
      <tr>
        <th scope="col">Código</th>
        <th scope="col">¿Sientes que las demandas de tu trabajo son excesivas o difíciles de manejar?</th>
        <th scope="col">¿Te resulta difícil desconectar del trabajo fuera del horario laboral?</th>
        <th scope="col">¿Experimentas fatiga o agotamiento, incluso después de descansar?</th>
        <th scope="col">¿Sientes que no tienes suficiente control sobre tus tareas o decisiones laborales?</th>
        <th scope="col">¿Te resulta difícil cumplir con los plazos y objetivos de trabajo?</th>
        <th scope="col">¿Sientes que tu carga de trabajo ha aumentado significativamente en los últimos meses?</th>
        <th scope="col">¿Te sientes apoyado emocionalmente por tus compañeros o líderes?</th>
        <th scope="col">¿Sientes que puedes hablar abiertamente sobre cómo te sientes en el trabajo?</th>
        <th scope="col">¿Te sientes satisfecho con el equilibrio entre tu vida laboral y personal?</th>
        <th scope="col">¿Hay algo que actualmente te esté afectando negativamente en tu entorno laboral?</th>
        <th scope="col">Acciones</th>
      </tr>
    </thead>
    <tbody>
      {formulario.map((f) => (
        <tr key={f.id_pregunta} className="text-center">
          <td>{f.id_pregunta}</td>
          <td>{f.Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar}</td>
          <td>{f.Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral}</td>
          <td>{f.Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar}</td>
          <td>{f.Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales}</td>
          <td>{f.Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo}</td>
          <td>{f.Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses}</td>
          <td>{f.Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres}</td>
          <td>{f.Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo}</td>
          <td>{f.Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal}</td>
          <td>{f.Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral}</td>
          <td>
            <button className="btn btn-sm btn-primary me-2">Editar</button>
            <button onClick={() => hanldeEliminar(f.id_pregunta)} className="btn btn-sm btn-primary me-2">Eliminar</button>
          </td>
        </tr>
      ))}
    </tbody>
  </table>
</div>
    </div>
  )
}
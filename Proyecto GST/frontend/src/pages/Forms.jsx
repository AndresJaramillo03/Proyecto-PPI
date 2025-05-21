import React, { useState, useEffect } from "react";
import fondoHome from "../assets/fondo-home.jpg";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
import axios from "axios";
import { ObtenerFormulario } from "../services/FormsService";
import SeeFrom from "./SeeFrom";
import { useNavigate } from "react-router-dom";
import Swal from 'sweetalert2'

export default function Forms() {

  const navegate = useNavigate();

  const verSeeform = () =>{
    navegate('/SeeFrom');
  }  

  const [formulario, setForm] = useState({
    /*id_pregunta: 23,*/
    Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar:'',
    Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral:'',
    Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar:'',
    Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales:'',
    Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo: '',
    Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses:'',
    Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres:'',
    Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo:'',
    Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal:'',
    Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral:'',
  })

  const handleChange = (e) => {
    setForm({ ...formulario, [e.target.name]: e.target.value });
  };

  const handleSumit =(e)=>{
    e.preventDefault()
    axios.post('http://localhost:3000/Forms', formulario)
    .then(response =>{
      Swal.fire('Exitoso','Formulario registrado', 'success')
    })
    .catch(error => console.log(error))
  }

  return (
    <div className="form-page-wrapper" style={{ backgroundImage: `url(${fondoHome})` }}>
      <div className="form-card">
        <h2 className="text-center">FORMULARIO</h2>
        
        <Form onSubmit={handleSumit}>
          <Row className="gy-4">
            <Col md={6}>
              <Form.Group controlId="r1">
                <Form.Label>
                  ¿Sientes que las demandas de tu trabajo son excesivas o difíciles de manejar?
                </Form.Label>
                <Form.Control 
                  type="text"
                  name="Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar"
                  value={formulario.Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r2">
                <Form.Label>
                  ¿Te resulta difícil desconectar del trabajo fuera del horario laboral?
                </Form.Label>
                <Form.Control 
                  type="text"
                  name="Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral"
                  value={formulario.Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral}
                  onChange={handleChange}
                  />

              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r3">
                <Form.Label>
                  ¿Experimentas fatiga o agotamiento, incluso después de descansar?
                </Form.Label>
                <Form.Control type="text"
                  name="Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar"
                  value={formulario.Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r4">
                <Form.Label>
                  ¿Sientes que no tienes suficiente control sobre tus tareas o decisiones laborales?
                </Form.Label>
                <Form.Control type="text"
                  name="Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales"
                  value={formulario.Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r5">
                <Form.Label>
                  ¿Te resulta difícil cumplir con los plazos y objetivos de trabajo?
                </Form.Label>
                <Form.Control type="text"
                  name="Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo"
                  value={formulario.Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r6">
                <Form.Label>
                  ¿Sientes que tu carga de trabajo ha aumentado significativamente en los últimos meses?
                </Form.Label>
                <Form.Control type="text"
                  name="Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses"
                  value={formulario.Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r7">
                <Form.Label>
                  ¿Te sientes apoyado emocionalmente por tus compañeros o lideres?
                </Form.Label>
                <Form.Control type="text"
                  name="Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres"
                  value={formulario.Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r8">
                <Form.Label>
                  ¿Sientes que puedes hablar abiertamente sobre como te sientes en el trabajo?
                </Form.Label>
                <Form.Control type="text"
                  name="Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo"
                  value={formulario.Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r9">
                <Form.Label>
                  ¿Te sientes satisfecho con el equilibrio entre tu vida laboral y personal?
                </Form.Label>
                <Form.Control type="text"
                  name="Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal"
                  value={formulario.Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

            <Col md={6}>
              <Form.Group controlId="r10">
                <Form.Label>
                  ¿Hay algo que actualmente te este afectando negativamente en tu entorno laboral?
                </Form.Label>
                <Form.Control type="text"
                  name="Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral"
                  value={formulario.Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral}
                  onChange={handleChange}
                />
              </Form.Group>
            </Col>

          </Row>

          <div className="form-actions mt-4 d-flex justify-content-between">
            <Button variant="info" type="submit" onClick={handleSumit}>Enviar</Button>
            <Button variant="outline-secondary" type="button" onClick={verSeeform}>Ver último formulario</Button>
          </div>
        </Form>
      </div>
    </div>
  );
}
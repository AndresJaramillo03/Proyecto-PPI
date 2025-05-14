import { getAllFormularios } from "../model/Formulario.js";

const getAllF = async (req,res) =>{
    try{

        const formularios = await getAllFormularios()
        res.json(formularios)

    }catch (error) {

        res.status(500).json({messager: error.messager})

    }
}

//Aqui
const postF = async (req, res) => {
  const { id_pregunta_fk, id_usuario_fk } = req.body;
  if (!id_pregunta_fk || !id_usuario_fk) {
    return res.status(400).json({ message: "Faltan datos obligatorios." });
  }
  try {
    const rows = await createFormulario({ id_pregunta_fk, id_usuario_fk });
    if (rows === 1) {
      res.status(201).json({ message: "Formulario guardado." });
    } else {
      res.status(500).json({ message: "No se pudo guardar." });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export { getAllF, postF };
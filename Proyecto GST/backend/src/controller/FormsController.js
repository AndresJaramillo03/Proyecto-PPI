import { getAllFormularios } from "../model/Formulario.js";
import { createFormularioCompleto } from "../model/Formulario.js";

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
  try {

    const {
      id_usuario_fk,
      r1, r2, r3, r4, r5, r6,
      r7, r8, r9, r10
    } = req.body;

    if (!id_usuario_fk || !r1 || !r2 || !r3 || !r4 || !r5 || !r6 || !r7 || !r8 || !r9 || !r10) {
      return res.status(400).json({ message: "Faltan respuestas o el ID de usuario." });
    }

    const success = await createFormularioCompleto({
      id_usuario_fk, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10
    });

    if (success) {
      res.status(201).json({ message: "Formulario guardado correctamente." });
    } else {
      res.status(500).json({ message: "No se pudo guardar." });
    }

} catch (error) {
  console.error("Error en postF:", error);
  res.status(500).json({ message: error.message });
}
};

export { getAllF, postF };